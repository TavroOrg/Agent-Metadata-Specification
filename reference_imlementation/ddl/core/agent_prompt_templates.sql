CREATE TABLE IF NOT EXISTS catalog_core.agent_prompt_templates (
  agent_id string,
  identifier string,
  name string,
  description string,
  created_ts timestamp,
  updated_ts timestamp
)
PARTITIONED BY (day(created_ts))
LOCATION 's3://catalog-prod/iceberg/core/agent_prompt_templates/'
TBLPROPERTIES (
  'table_type'='ICEBERG',
  'format'='parquet',
  'write_compression'='snappy'
);
