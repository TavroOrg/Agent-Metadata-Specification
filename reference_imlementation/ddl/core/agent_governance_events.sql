CREATE TABLE IF NOT EXISTS catalog_core.agent_governance_events (
	governance_event_id string,
	agent_id string,
	event_type string,
	event_ts timestamp,
	actor_name string,
	status string,
	notes string,
	created_ts timestamp
)
PARTITIONED BY (day(created_ts))
LOCATION 's3://catalog-prod/iceberg/core/agent_governance_events/'
TBLPROPERTIES (
	'table_type' = 'ICEBERG',
	'format' = 'parquet',
	'write_compression' = 'snappy'
);
