CREATE TABLE IF NOT EXISTS catalog_core.agent_guardrails (
  agent_id string,
  name string,
  description string,
  model string,
  created_ts timestamp,
  updated_ts timestamp
)
PARTITIONED BY (day(created_ts))
LOCATION 's3://catalog-prod/iceberg/core/agent_guardrails/'
TBLPROPERTIES (
  'table_type'='ICEBERG',
  'format'='parquet',
  'write_compression'='snappy'
);
