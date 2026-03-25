# Agent Metadata Reference Implementation (AWS)

This folder contains an AWS-native reference implementation for ingesting agent metadata JSON, modeling it in Iceberg tables, and serving analytics through Athena.

## Folder structure

- `ddl/`
  - `Database/` -> database-level DDL (`catalog_raw`, `catalog_core`, `catalog_curated`)
  - `Raw/` -> raw-layer table DDL
  - `Core/` -> canonical/core table DDL
  - `Curated/` -> curated/reporting table DDL
- `etl/`
  - `agent_card_ingest_job.py` -> Glue PySpark job (S3 JSON -> transform -> upsert into Iceberg)
  - `agent-card-ingest-job.ipynb` -> notebook version of the same flow
- `docs/`
  - `architecture.md` -> architecture and execution flow
  - `architecture-lineage.svg` -> lineage diagram
- `curated_build/`
  - curated-layer build artifacts/scripts

## Data architecture

- Storage: Amazon S3 (`s3://catalog-prod/iceberg/...`)
- Catalog: AWS Glue Data Catalog
- Query/ELT: Amazon Athena + Glue PySpark
- Security: IAM + KMS

Logical layers:
- `catalog_raw`
- `catalog_core`
- `catalog_curated`

## Ingestion flow (current reference)

1. Agent card JSON files are placed in S3 (lineage diagram uses `s3://catalog-prod/raw/agent-cards/`).
2. Glue PySpark job reads JSON files, maps fields, computes hashes/timestamps.
3. Job performs `MERGE INTO` upsert into Iceberg core table(s), currently `catalog_core.agents`.
4. Downstream Athena/Glue transforms can populate additional core and curated tables.

## Apply DDL

Run in this order:

1. `ddl/Database/*.sql`
2. `ddl/Raw/*.sql`
3. `ddl/Core/*.sql`
4. `ddl/Curated/*.sql`

## Run ETL job

Primary script: `etl/agent_card_ingest_job.py`

Supported Glue args:
- `JOB_NAME`
- `S3_INPUT_BUCKET` (default: `catalog-prod`)
- `S3_INPUT_PREFIX` (default: `inbound/agent-cards/`)
- `CATALOG` (default: `glue_catalog`)
- `DATABASE` (default: `catalog_core`)
- `TABLE` (default: `agents`)
- `SOURCE_SYSTEM` (default: `ServiceNow`)
- `SHOW_SAMPLE` (default: `true`)

Example (conceptual):

```bash
--JOB_NAME agent-card-ingest-job
--S3_INPUT_BUCKET catalog-prod
--S3_INPUT_PREFIX raw/agent-cards/
--CATALOG glue_catalog
--DATABASE catalog_core
--TABLE agents
```

## Documentation

- Architecture: [`docs/architecture.md`](./docs/architecture.md)
- Lineage diagram: [`docs/architecture-lineage.svg`](./docs/architecture-lineage.svg)
