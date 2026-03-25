CREATE TABLE IF NOT EXISTS catalog_core.agent_memories (
  agent_id string,
  identifier string,
  name string,
  type string,
  status string,
  description string,
  created_ts timestamp,
  updated_ts timestamp
)
PARTITIONED BY (day(created_ts))
LOCATION 's3://catalog-prod/iceberg/core/agent_memories/'
TBLPROPERTIES (
  'table_type'='ICEBERG',
  'format'='parquet',
  'write_compression'='snappy'
);
