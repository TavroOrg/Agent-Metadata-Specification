CREATE TABLE IF NOT EXISTS catalog_core.agent_regulations_or_frameworks (
  agent_id string,
  name string,
  type string,
  regulatory_authority string,
  jurisdiction string,
  requirement string,
  created_ts timestamp,
  updated_ts timestamp
)
PARTITIONED BY (day(created_ts))
LOCATION 's3://catalog-prod/iceberg/core/agent_regulations_or_frameworks/'
TBLPROPERTIES (
  'table_type'='ICEBERG',
  'format'='parquet',
  'write_compression'='snappy'
);
