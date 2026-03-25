CREATE TABLE IF NOT EXISTS catalog_core.agents (
	agent_id string,
	agent_name string,
	agent_description string,
	protocol_version string,
	preferred_transport string,
	supports_auth_ext_card boolean,
	card_version string,
	source_hash string,
	source_system string,
	record_hash string,
	valid_from_ts timestamp,
	valid_to_ts timestamp,
	is_current boolean,
	created_ts timestamp,
	updated_ts timestamp
)
PARTITIONED BY (day(created_ts))
LOCATION 's3://catalog-prod/iceberg/core/agents/'
TBLPROPERTIES (
	'table_type' = 'ICEBERG',
	'format' = 'parquet',
	'write_compression' = 'snappy'
);
