CREATE TABLE IF NOT EXISTS catalog_core.agent_business_processes (
	business_process_id string,
	agent_id string,
	process_name string,
	process_stage string,
	process_owner string,
	business_function string,
	criticality string,
	integration_role string,
	created_ts timestamp,
	updated_ts timestamp
)
PARTITIONED BY (day(created_ts))
LOCATION 's3://catalog-prod/iceberg/core/agent_business_processes/'
TBLPROPERTIES (
	'table_type' = 'ICEBERG',
	'format' = 'parquet',
	'write_compression' = 'snappy'
);
