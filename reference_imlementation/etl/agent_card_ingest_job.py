import sys
import json
import hashlib
import datetime

import boto3
from awsglue.utils import getResolvedOptions
from awsglue.context import GlueContext
from awsglue.job import Job
from pyspark.context import SparkContext
from pyspark.sql.types import (
    StructType,
    StructField,
    StringType,
    TimestampType,
    BooleanType,
)


def get_nested_value(data, keys):
    current = data
    for key in keys:
        if isinstance(current, dict) and key in current:
            current = current[key]
        else:
            return None
    return current


def parse_bool(value, default=False):
    if value is None:
        return default
    return str(value).strip().lower() in {"1", "true", "yes", "y"}


def resolve_args():
    required = ["JOB_NAME"]
    optional = [
        "S3_INPUT_BUCKET",
        "S3_INPUT_PREFIX",
        "CATALOG",
        "DATABASE",
        "TABLE",
        "SOURCE_SYSTEM",
        "SHOW_SAMPLE",
    ]

    try:
        args = getResolvedOptions(sys.argv, required + optional)
    except Exception:
        args = {}
        try:
            args.update(getResolvedOptions(sys.argv, required))
        except Exception:
            args["JOB_NAME"] = "agent-card-ingest-job-dev"

    config = {
        "JOB_NAME": args.get("JOB_NAME", "agent-card-ingest-job-dev"),
        "S3_INPUT_BUCKET": args.get("S3_INPUT_BUCKET", "catalog-prod"),
        "S3_INPUT_PREFIX": args.get("S3_INPUT_PREFIX", "raw/agent-cards/"),
        "CATALOG": args.get("CATALOG", "glue_catalog"),
        "DATABASE": args.get("DATABASE", "catalog_core"),
        "TABLE": args.get("TABLE", "agents"),
        "SOURCE_SYSTEM": args.get("SOURCE_SYSTEM", "ServiceNow"),
        "SHOW_SAMPLE": parse_bool(args.get("SHOW_SAMPLE", "true"), default=True),
    }
    return config


def list_json_keys(s3_client, bucket, prefix):
    keys = []
    continuation_token = None

    while True:
        kwargs = {"Bucket": bucket, "Prefix": prefix, "MaxKeys": 1000}
        if continuation_token:
            kwargs["ContinuationToken"] = continuation_token

        response = s3_client.list_objects_v2(**kwargs)
        for item in response.get("Contents", []):
            key = item["Key"]
            if key.lower().endswith(".json"):
                keys.append(key)

        if response.get("IsTruncated"):
            continuation_token = response.get("NextContinuationToken")
        else:
            break

    return keys


def main():
    cfg = resolve_args()

    sc = SparkContext.getOrCreate()
    glue_context = GlueContext(sc)
    spark = glue_context.spark_session
    job = Job(glue_context)
    job.init(cfg["JOB_NAME"], {"JOB_NAME": cfg["JOB_NAME"]})

    s3 = boto3.client("s3")
    bucket = cfg["S3_INPUT_BUCKET"]
    prefix = cfg["S3_INPUT_PREFIX"]

    s3_keys = list_json_keys(s3, bucket, prefix)
    print(f"[INFO] Found {len(s3_keys)} JSON file(s) under s3://{bucket}/{prefix}")
    for i, key in enumerate(s3_keys):
        print(f"  [{i + 1}] s3://{bucket}/{key}")

    if not s3_keys:
        print("[INFO] No input files found. Exiting.")
        job.commit()
        return

    raw_rows = []
    failed_keys = []
    now_utc = datetime.datetime.now(datetime.timezone.utc)
    max_timestamp_utc = datetime.datetime(
        9999, 12, 31, 23, 59, 59, tzinfo=datetime.timezone.utc
    )

    for key in s3_keys:
        try:
            obj = s3.get_object(Bucket=bucket, Key=key)
            content = json.loads(obj["Body"].read().decode("utf-8"))
            records = content if isinstance(content, list) else [content]

            for r in records:
                row = {}
                row["agent_id"] = get_nested_value(r, ["identification", "agent_id"])
                row["agent_name"] = get_nested_value(r, ["name"])
                row["agent_description"] = get_nested_value(r, ["description"])
                row["protocol_version"] = get_nested_value(r, ["protocol_version"])
                row["preferred_transport"] = get_nested_value(r, ["preferredTransport"])
                row["supports_auth_ext_card"] = get_nested_value(
                    r, ["supports_authenticated_extended_card"]
                )
                row["card_version"] = get_nested_value(r, ["version"])
                row["source_system"] = cfg["SOURCE_SYSTEM"]

                source_hash_input = json.dumps(r, sort_keys=True).encode("utf-8")
                row["source_hash"] = hashlib.sha256(source_hash_input).hexdigest()

                row["valid_from_ts"] = now_utc
                row["valid_to_ts"] = max_timestamp_utc
                row["is_current"] = True
                row["created_ts"] = now_utc
                row["updated_ts"] = now_utc

                hashable = {
                    k: v
                    for k, v in row.items()
                    if k
                    not in {"record_hash", "created_ts", "updated_ts", "valid_from_ts"}
                }
                record_hash_input = json.dumps(
                    hashable, sort_keys=True, default=str
                ).encode("utf-8")
                row["record_hash"] = hashlib.sha256(record_hash_input).hexdigest()

                raw_rows.append(row)

            print(f"[INFO] Parsed {len(records)} record(s) from s3://{bucket}/{key}")
        except Exception as exc:
            print(f"[WARN] Failed to process s3://{bucket}/{key} - {exc}")
            failed_keys.append(key)

    print(f"[INFO] Total rows to upsert: {len(raw_rows)} | Failed files: {len(failed_keys)}")
    if not raw_rows:
        print("[WARN] No valid rows parsed. Skipping upsert.")
        job.commit()
        return

    schema = StructType(
        [
            StructField("agent_id", StringType(), True),
            StructField("agent_name", StringType(), True),
            StructField("agent_description", StringType(), True),
            StructField("protocol_version", StringType(), True),
            StructField("preferred_transport", StringType(), True),
            StructField("supports_auth_ext_card", BooleanType(), True),
            StructField("card_version", StringType(), True),
            StructField("source_system", StringType(), True),
            StructField("source_hash", StringType(), True),
            StructField("valid_from_ts", TimestampType(), True),
            StructField("valid_to_ts", TimestampType(), True),
            StructField("is_current", BooleanType(), True),
            StructField("created_ts", TimestampType(), True),
            StructField("updated_ts", TimestampType(), True),
            StructField("record_hash", StringType(), True),
        ]
    )

    df = spark.createDataFrame(raw_rows, schema=schema).dropDuplicates(
        ["agent_id", "card_version"]
    )
    df.createOrReplaceTempView("staging")

    print(f"[INFO] Staging DataFrame ready. Row count: {df.count()}")
    if cfg["SHOW_SAMPLE"]:
        df.show(truncate=False)

    spark.conf.set("spark.sql.defaultCatalog", cfg["CATALOG"])
    spark.sql(f"USE {cfg['DATABASE']}")

    merge_sql = f"""
        MERGE INTO {cfg['TABLE']} AS target
        USING staging AS source
        ON target.agent_id = source.agent_id
        WHEN MATCHED AND target.record_hash != source.record_hash THEN
            UPDATE SET
                agent_name = source.agent_name,
                agent_description = source.agent_description,
                protocol_version = source.protocol_version,
                preferred_transport = source.preferred_transport,
                supports_auth_ext_card = source.supports_auth_ext_card,
                card_version = source.card_version,
                source_hash = source.source_hash,
                record_hash = source.record_hash,
                updated_ts = source.updated_ts,
                valid_from_ts = source.valid_from_ts
        WHEN NOT MATCHED THEN
            INSERT *
    """

    print(
        f"[INFO] Running MERGE INTO {cfg['CATALOG']}.{cfg['DATABASE']}.{cfg['TABLE']}..."
    )
    spark.sql(merge_sql)
    print("[INFO] MERGE complete.")

    job.commit()
    print("[INFO] Job committed successfully.")


if __name__ == "__main__":
    main()
