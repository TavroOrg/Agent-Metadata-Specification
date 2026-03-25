CREATE TABLE IF NOT EXISTS catalog_core.agent_tools (
	tool_id string,
	agent_id string,
	tool_name string,
	tool_description string,
	delegation_possible boolean,
	allowed_delegates string,
	input_schema_json_text string,
	output_schema_json_text string,
	default_config_json_text string,
	created_ts timestamp,
	updated_ts timestamp
)
PARTITIONED BY (day(created_ts))
LOCATION 's3://catalog-prod/iceberg/core/agent_tools/'
TBLPROPERTIES (
	'table_type' = 'ICEBERG',
	'format' = 'parquet',
	'write_compression' = 'snappy'
);
