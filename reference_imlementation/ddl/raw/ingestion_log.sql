CREATE TABLE IF NOT EXISTS catalog_raw.ingestion_log (
	ingestion_run_id string,
	pipeline_name string,
	pipeline_version string,
	source_system string,
	file_count bigint,
	record_count bigint,
	success_count bigint,
	failure_count bigint,
	started_at timestamp,
	completed_at timestamp,
	status string,
	error_summary string,
	created_at timestamp
)
PARTITIONED BY (day(created_at))
LOCATION 's3://catalog-prod/iceberg/raw/ingestion_log/'
TBLPROPERTIES (
	'table_type' = 'ICEBERG',
	'format' = 'parquet',
	'write_compression' = 'snappy'
);
