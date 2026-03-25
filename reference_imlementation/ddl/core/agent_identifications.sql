CREATE TABLE IF NOT EXISTS catalog_core.agent_identifications (
  agent_id string,
  goal_orientation string,
  role string,
  instruction string,
  owner string,
  environment string,
  tags array<string>,
  governance_status string,
  reviewer string,
  cost_center string,
  is_current boolean,
  created_ts timestamp,
  updated_ts timestamp
)
PARTITIONED BY (day(created_ts))
LOCATION 's3://catalog-prod/iceberg/core/agent_identifications/'
TBLPROPERTIES (
  'table_type'='ICEBERG',
  'format'='parquet',
  'write_compression'='snappy'
);
