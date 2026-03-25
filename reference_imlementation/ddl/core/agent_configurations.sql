CREATE TABLE IF NOT EXISTS catalog_core.agent_configurations (
	agent_id string,
	access_scope string,
	memory_type string,
	data_freshness_policy string,
	autonomy_level string,
	reasoning_model string,
	human_in_the_loop_flag boolean,
	execution_mode string,
	record_hash string,
	valid_from_ts timestamp,
	valid_to_ts timestamp,
	is_current boolean,
	created_ts timestamp,
	updated_ts timestamp
)
PARTITIONED BY (day(created_ts))
LOCATION 's3://catalog-prod/iceberg/core/agent_configurations/'
TBLPROPERTIES (
	'table_type' = 'ICEBERG',
	'format' = 'parquet',
	'write_compression' = 'snappy'
);
