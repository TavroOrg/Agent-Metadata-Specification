CREATE TABLE IF NOT EXISTS catalog_core.agent_ai_models (
	ai_model_id string,
	agent_id string,
	model_name string,
	model_provider string,
	model_version string,
	model_type string,
	is_primary_model boolean,
	usage_role string,
	created_ts timestamp,
	updated_ts timestamp
)
PARTITIONED BY (day(created_ts))
LOCATION 's3://catalog-prod/iceberg/core/agent_ai_models/'
TBLPROPERTIES (
	'table_type' = 'ICEBERG',
	'format' = 'parquet',
	'write_compression' = 'snappy'
);
