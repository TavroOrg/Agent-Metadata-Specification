INSERT INTO tavro_curated.agent_360
SELECT
    a.agent_id,
    a.agent_name,
    a.agent_description,
    c.autonomy_level,
    c.memory_type,
    c.reasoning_model,
    COALESCE(t.tool_count, 0) AS tool_count,
    COALESCE(ds.data_source_count, 0) AS data_source_count,
    COALESCE(ba.business_application_count, 0) AS business_application_count,
    COALESCE(bp.business_process_count, 0) AS business_process_count,
    COALESCE(am.ai_model_count, 0) AS ai_model_count,
    am.primary_ai_model_name,
    am.primary_ai_model_provider,
    ba.primary_business_application_name,
    bp.primary_business_process_name,
    COALESCE(ds.contains_pii, false) AS contains_pii,
    COALESCE(ds.contains_phi, false) AS contains_phi,
    COALESCE(ds.contains_pci, false) AS contains_pci,
    ra.blended_risk_score AS latest_risk_score,
    ra.blended_risk_class AS latest_risk_class,
    ge.status AS latest_event_status,
    current_timestamp AS snapshot_ts
FROM tavro_core.agents a
LEFT JOIN tavro_core.agent_configurations c
  ON a.agent_id = c.agent_id
 AND c.is_current = true
LEFT JOIN (
    SELECT agent_id, COUNT(*) AS tool_count
    FROM tavro_core.agent_tools
    GROUP BY agent_id
) t
  ON a.agent_id = t.agent_id
LEFT JOIN (
    SELECT
      agent_id,
      COUNT(*) AS data_source_count,
      max(CASE WHEN contains_pii THEN true ELSE false END) AS contains_pii,
      max(CASE WHEN contains_phi THEN true ELSE false END) AS contains_phi,
      max(CASE WHEN contains_pci THEN true ELSE false END) AS contains_pci
    FROM tavro_core.agent_data_sources
    GROUP BY agent_id
) ds
  ON a.agent_id = ds.agent_id
LEFT JOIN (
    SELECT
      agent_id,
      COUNT(*) AS business_application_count,
      max(CASE WHEN is_primary THEN application_name ELSE NULL END) AS primary_business_application_name
    FROM tavro_core.agent_business_applications
    GROUP BY agent_id
) ba
  ON a.agent_id = ba.agent_id
LEFT JOIN (
    SELECT
      agent_id,
      COUNT(*) AS business_process_count,
      max(CASE WHEN is_primary THEN process_name ELSE NULL END) AS primary_business_process_name
    FROM tavro_core.agent_business_processes
    GROUP BY agent_id
) bp
  ON a.agent_id = bp.agent_id
LEFT JOIN (
    SELECT
      agent_id,
      COUNT(*) AS ai_model_count,
      max(CASE WHEN is_primary_model THEN model_name ELSE NULL END) AS primary_ai_model_name,
      max(CASE WHEN is_primary_model THEN model_provider ELSE NULL END) AS primary_ai_model_provider
    FROM tavro_core.agent_ai_models
    GROUP BY agent_id
) am
  ON a.agent_id = am.agent_id
LEFT JOIN tavro_core.agent_risk_assessments ra
  ON a.agent_id = ra.agent_id
 AND ra.is_current = true
LEFT JOIN (
    SELECT agent_id, max_by(status, event_ts) AS status
    FROM tavro_core.agent_governance_events
    GROUP BY agent_id
) ge
  ON a.agent_id = ge.agent_id
WHERE a.is_current = true;