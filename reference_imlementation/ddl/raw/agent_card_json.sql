CREATE TABLE IF NOT EXISTS catalog_raw.agent_card_json (
	ingest_id string,
	source_file_name string,
	source_file_path string,
	source_system string,
	agent_id string,
	card_version string,
	payload_json_text string,
	payload_hash string,
	ingestion_run_id string,
	ingested_at timestamp,
	is_valid_json boolean,
	load_status string,
	load_error_message string
)
PARTITIONED BY (day(ingested_at))
LOCATION 's3://catalog-prod/iceberg/raw/agent_card_json/'
TBLPROPERTIES (
	'table_type' = 'ICEBERG',
	'format' = 'parquet',
	'write_compression' = 'snappy'
);
