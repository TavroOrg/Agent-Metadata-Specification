CREATE TABLE IF NOT EXISTS catalog_core.agent_data_sources (
	data_source_id string,
	agent_id string,
	data_source_name string,
	object_type string,
	domain_name string,
	platform_name string,
	access_level string,
	contains_pii boolean,
	contains_phi boolean,
	contains_pci boolean,
	source_system string,
	created_ts timestamp,
	updated_ts timestamp
)
PARTITIONED BY (day(created_ts))
LOCATION 's3://catalog-prod/iceberg/core/agent_data_sources/'
TBLPROPERTIES (
	'table_type' = 'ICEBERG',
	'format' = 'parquet',
	'write_compression' = 'snappy'
);
