CREATE TABLE IF NOT EXISTS catalog_core.agent_risk_assessments (
	risk_assessment_id string,
	agent_id string,
	assessment_name string,
	assessor_name string,
	assessment_ts timestamp,
	blended_risk_score decimal(10, 2),
	blended_risk_class string,
	aivss_score decimal(10, 2),
	aivss_class string,
	regulatory_risk_score decimal(10, 2),
	regulatory_risk_class string,
	state_name string,
	record_hash string,
	valid_from_ts timestamp,
	valid_to_ts timestamp,
	is_current boolean,
	created_ts timestamp,
	updated_ts timestamp
)
PARTITIONED BY (day(created_ts))
LOCATION 's3://catalog-prod/iceberg/core/agent_risk_assessments/'
TBLPROPERTIES (
	'table_type' = 'ICEBERG',
	'format' = 'parquet',
	'write_compression' = 'snappy'
);
