CREATE TABLE IF NOT EXISTS catalog_curated.agent_360 (
    agent_id string,
    agent_name string,
    agent_description string,
    autonomy_level string,
    memory_type string,
    reasoning_model string,
    tool_count bigint,
    data_source_count bigint,
    business_application_count bigint,
    business_process_count bigint,
    ai_model_count bigint,
    primary_ai_model_name string,
    primary_ai_model_provider string,
    contains_pii boolean,
    contains_phi boolean,
    contains_pci boolean,
    latest_risk_score decimal(10, 2),
    latest_risk_class string,
    latest_event_status string,
    snapshot_ts timestamp
)
PARTITIONED BY (day(snapshot_ts))
LOCATION 's3://catalog-prod/iceberg/curated/agent_360/'
TBLPROPERTIES (
    'table_type'='ICEBERG',
    'format'='parquet',
    'write_compression'='snappy'
);
