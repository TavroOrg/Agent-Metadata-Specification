CREATE TABLE IF NOT EXISTS catalog_curated.agent_risk_dashboard (
  agent_id string,
  agent_name string,
  assessment_ts timestamp,
  blended_risk_score decimal(10,2),
  blended_risk_class string,
  aivss_score decimal(10,2),
  aivss_class string,
  regulatory_risk_score decimal(10,2),
  regulatory_risk_class string,
  state_name string,
  primary_ai_model_name string,
  business_application_count bigint,
  business_process_count bigint,
  snapshot_ts timestamp
)
PARTITIONED BY (day(snapshot_ts))
LOCATION 's3://catalog-prod/iceberg/curated/agent_risk_dashboard/'
TBLPROPERTIES (
  'table_type'='ICEBERG',
  'format'='parquet',
  'write_compression'='snappy'
);
