CREATE TABLE IF NOT EXISTS catalog_core.agent_business_applications (
	business_application_id string,
	agent_id string,
	application_name string,
	application_type string,
	owning_team string,
	business_owner string,
	environment_name string,
	criticality string,
	integration_role string,
	created_ts timestamp,
	updated_ts timestamp
)
PARTITIONED BY (day(created_ts))
LOCATION 's3://catalog-prod/iceberg/core/agent_business_applications/'
TBLPROPERTIES (
	'table_type' = 'ICEBERG',
	'format' = 'parquet',
	'write_compression' = 'snappy'
);
