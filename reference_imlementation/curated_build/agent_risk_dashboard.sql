INSERT INTO catalog_curated.agent_risk_dashboard
SELECT
    a.agent_id,
    a.agent_name,
    ra.assessment_ts,
    ra.blended_risk_score,
    ra.blended_risk_class,
    ra.aivss_score,
    ra.aivss_class,
    ra.regulatory_risk_score,
    ra.regulatory_risk_class,
    ra.state_name,
    am.primary_ai_model_name,
    ba.primary_business_application_name,
    bp.primary_business_process_name,
    COALESCE(ba.business_application_count, 0) AS business_application_count,
    COALESCE(bp.business_process_count, 0) AS business_process_count,
    current_timestamp AS snapshot_ts
FROM catalog_core.agents a
JOIN catalog_core.agent_risk_assessments ra
  ON a.agent_id = ra.agent_id
 AND ra.is_current = true
LEFT JOIN (
    SELECT
      agent_id,
      max(CASE WHEN is_primary_model THEN model_name ELSE NULL END) AS primary_ai_model_name
    FROM catalog_core.agent_ai_models
    GROUP BY agent_id
) am
  ON a.agent_id = am.agent_id
LEFT JOIN (
    SELECT
      agent_id,
      COUNT(*) AS business_application_count,
      max(CASE WHEN is_primary THEN application_name ELSE NULL END) AS primary_business_application_name
    FROM catalog_core.agent_business_applications
    GROUP BY agent_id
) ba
  ON a.agent_id = ba.agent_id
LEFT JOIN (
    SELECT
      agent_id,
      COUNT(*) AS business_process_count,
      max(CASE WHEN is_primary THEN process_name ELSE NULL END) AS primary_business_process_name
    FROM catalog_core.agent_business_processes
    GROUP BY agent_id
) bp
  ON a.agent_id = bp.agent_id
WHERE a.is_current = true;
