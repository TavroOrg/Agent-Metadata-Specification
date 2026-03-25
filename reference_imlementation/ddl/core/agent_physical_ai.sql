CREATE TABLE IF NOT EXISTS catalog_core.agent_physical_ai (
  agent_id string,
  identifier string,
  name string,
  type string,
  sensory_input_source string,
  created_ts timestamp,
  updated_ts timestamp
)
PARTITIONED BY (day(created_ts))
LOCATION 's3://catalog-prod/iceberg/core/agent_physical_ai/'
TBLPROPERTIES (
  'table_type'='ICEBERG',
  'format'='parquet',
  'write_compression'='snappy'
);
