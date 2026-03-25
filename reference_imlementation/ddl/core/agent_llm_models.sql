CREATE TABLE IF NOT EXISTS catalog_core.agent_llm_models (
  agent_id string,
  name string,
  version_number string,
  created_ts timestamp,
  updated_ts timestamp
)
PARTITIONED BY (day(created_ts))
LOCATION 's3://catalog-prod/iceberg/core/agent_llm_models/'
TBLPROPERTIES (
  'table_type'='ICEBERG',
  'format'='parquet',
  'write_compression'='snappy'
);
