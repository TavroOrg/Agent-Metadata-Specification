CREATE TABLE IF NOT EXISTS catalog_core.agent_knowledge_sources (
  agent_id string,
  identifier string,
  name string,
  access_mechanism string,
  description string,
  source_type string,
  connection_string string,
  format string,
  refresh_frequency string,
  is_sensitive boolean,
  owner string,
  status string,
  created_ts timestamp,
  updated_ts timestamp
)
PARTITIONED BY (day(created_ts))
LOCATION 's3://catalog-prod/iceberg/core/agent_knowledge_sources/'
TBLPROPERTIES (
  'table_type'='ICEBERG',
  'format'='parquet',
  'write_compression'='snappy'
);
