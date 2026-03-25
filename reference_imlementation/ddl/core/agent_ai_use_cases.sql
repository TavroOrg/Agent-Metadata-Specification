CREATE TABLE IF NOT EXISTS catalog_core.agent_ai_use_cases (
  agent_id string,
  identifier string,
  name string,
  description string,
  proposed_by string,
  owner string,
  function string,
  problem_statement string,
  expected_benefits string,
  priority string,
  status string,
  created_ts timestamp,
  updated_ts timestamp
)
PARTITIONED BY (day(created_ts))
LOCATION 's3://catalog-prod/iceberg/core/agent_ai_use_cases/'
TBLPROPERTIES (
  'table_type'='ICEBERG',
  'format'='parquet',
  'write_compression'='snappy'
);
