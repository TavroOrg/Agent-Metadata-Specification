# Applying the Agent Metadata Specification to the Life Insurance in South Africa — Intelligent Automated Underwriting & Risk Assessment

## Introduction

The cross-industry Agent Metadata Specification is published [here](https://github.com/TavroOrg/Agent-Metadata-Specification/tree/main/assets/Publications). This section provides  an example that combines all the relevant artifacts for the life insurance industry in South Africa.

## Conceptual Model

An overall conceptual model for the use case is shown in Figure 1.

<p align="center">
  <img src="../assets/images/Life Insurance– Intelligent Automated Underwriting & Risk Assessment for Life Insurance.png" alt="Life Insurance– Intelligent Automated Underwriting & Risk Assessment for Life Insurance" width="600">
  <br>
  <em>Figure 1: Conceptual model for the Insurance Underwriting Intake & Risk Intelligence Agent</em>
</p>

This summary covers the following (see Table 1):

<table align="center">
  <thead>
    <tr>
      <th>Artifacts</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1. AI Use Case</td>
      <td>
        <ul>
          <li>Intelligent Automated Underwriting &amp; Risk Assessment for Life Insurance</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>2. Agent</td>
      <td>
        <ul>
          <li>Life Insurance Underwriting Intake &amp; Risk Intelligence Agent</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>3. Data Sources</td>
      <td>
        <ul>
          <li>Policy Administration System (PAS)</li>
          <li>Medical Examination Reports Repository</li>
          <li>Attending Physician Statements (APS)</li>
          <li>National Credit Bureau (NCB)</li>
          <li>Internal Mortality &amp; Claims Data Warehouse</li>
          <li>ASISA Industry Mortality Tables</li>
          <li>Department of Home Affairs (DHA) Identity Verification API</li>
          <li>POPIA Consent Registry</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>4. Tools</td>
      <td>
        <ul>
          <li>OCR Document Extractor</li>
          <li>NLP Data Parser</li>
          <li>ML Risk Scoring API</li>
          <li>DHA Identity Verification API</li>
          <li>Credit Bureau Connector</li>
          <li>Mortality Table Lookup</li>
          <li>PAS Integration API</li>
          <li>Audit Trail Logger</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>5. Applications</td>
      <td>
        <ul>
          <li>Policy Administration System (PAS)</li>
          <li>Audit Trail &amp; Compliance Logger</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>6. Business Processes</td>
      <td>
        <ul>
          <li>New Business Application Intake</li>
          <li>Underwriting Risk Assessment &amp; ML Scoring</li>
          <li>Regulatory Compliance Validation</li>
          <li>Identity Verification (FICA KYC/AML)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>7. Regulations</td>
      <td>
        <ul>
          <li>Long-Term Insurance Act 52 of 1998 (LTIA) &mdash; Section 48</li>
          <li>Protection of Personal Information Act (POPIA) &mdash; Chapter 3</li>
          <li>Financial Intelligence Centre Act (FICA)</li>
          <li>FSCA Conduct Standard for Long-term Insurers</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>8. Agent Risk Assessment</td>
      <td>
        <ul>
          <li>Business Continuity Assessment</li>
          <li>Legal Risk Assessment</li>
          <li>Regulatory Risk Assessment</li>
          <li>Cybersecurity Risk Assessment (OWASP AIVSS: 6.3/10 &mdash; High)</li>
          <li>Statutory Reporting Risk Assessment</li>
          <li>Data Risk Assessment</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 1: Agent metadata artifacts for Intelligent Automated Underwriting & Risk Assessment</em>
</p>

## 1. AI Use Case — Intelligent Automated Underwriting & Risk Assessment for Life Insurance

The Intelligent Automated Underwriting & Risk Assessment use case deploys a multi-agent AI system to automate and augment the end-to-end underwriting lifecycle for  life insurance in South Africa.

Insurance underwriting operations are heavily manual, resulting in long policy issuance cycle times (often exceeding 10 business days), inconsistent risk assessments across underwriter cohorts, growing regulatory compliance pressure under LTIA, FSCA, POPIA and TCF, and high operational costs per policy issued. The volume of new business applications is increasing while skilled underwriting resources remain constrained, creating a capacity and quality risk that threatens both profitability and customer experience.

The use case encompasses the following expected benefits:

- Reduced underwriting cycle time from 10+ business days to under 5 days (stretch target: 2 days)
- Achieved straight-through processing (STP) rate of 40–65% for standard applications
- Improved underwriting risk prediction accuracy to within 2–5% deviation against actual claims experience
- Regulatory audit pass rate of 98–100% across LTIA, FSCA, POPIA and TCF compliance checks
- Reduced cost per policy issued by 20–35% through automation of low-complexity cases
- Improved applicant NPS by +15 to +30 points through faster decisions and personalized communication
- Senior underwriters freed to focus on complex, substandard, and facultative reinsurance cases

The solution approach is a multi-agent autonomous AI architecture comprising three specialized agents: (1) Intake & Risk Intelligence Agent for document extraction and ML risk scoring, (2) Compliance & Decisioning Agent for rules-based regulatory checks and underwriting decision-making, and (3) Communication & Case Management Agent for applicant/broker communication and SLA tracking. Agents integrate via the PAS and share a common audit trail for regulatory explainability.

## 2. Agent — Insurance Underwriting Intake & Risk Intelligence Agent 

The Insurance Underwriting Intake & Risk Intelligence Agent is the frontline ingestion and scoring agent of the AI use case. It handles the receipt of all new life insurance applications, extracting, validating, and enriching applicant data from structured and unstructured documents, and running the ML risk-scoring model to produce a tiered risk classification and structured risk recommendation for downstream processing by the Compliance & Decisioning Agent.

The agent follows a strict nine-step process:

1. Receive new application payload from the Policy Administration System (PAS)
2. Invoke OCR and NLP tools to extract structured data from uploaded medical examination reports, Attending Physician Statements (APS), financial statements, and identity documents
3. Validate data completeness against LTIA Section 48 non-disclosure and material misrepresentation requirements — flag any gaps or inconsistencies for human review
4. Invoke the DHA Identity Verification API to confirm applicant identity in compliance with FICA KYC/AML requirements
5. Enrich applicant data via the National Credit Bureau connector and cross-reference against  internal mortality and claims data warehouse and ASISA industry mortality tables
6. Execute the ML risk scoring model to classify the applicant into one of five risk tiers: Standard, Rated, Exclusion Required, Postpone, or Decline
7. Ensure all health data processing is logged with appropriate POPIA consent records before enrichment steps are invoked
8. Produce a structured, annotated risk summary and pass it to the Compliance & Decisioning Agent via the PAS integration API
9. Log all extraction, validation, and scoring steps to the audit trail with confidence scores and contributing risk factors for regulatory explainability

Key behavioral guardrail: the agent must never issue a final underwriting decision autonomously. All risk classifications are recommendations only — final decisions are made by the Compliance & Decisioning Agent or, for non-STP cases, a qualified human underwriter.

## 3. Data Sources

The Insurance Underwriting Intake & Risk Intelligence Agent accesses multiple data sources (see Table 2). All tools and data sources carry PII and PHI flags — no PCI data is processed by this agent.


<table align="center">
  <thead>
    <tr>
      <th>Data Source</th>
      <th>Type &amp; Sensitivity</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Policy Administration System (PAS)</td>
      <td>Table &mdash; PII/PHI</td>
      <td>Application payloads read/write. Primary system of record for all underwriting decisions and case status.</td>
    </tr>
    <tr>
      <td>Medical Examination Reports</td>
      <td>Table &mdash; PII/PHI</td>
      <td>Medical examination reports processed via OCR and NLP extraction. Special personal information under POPIA.</td>
    </tr>
    <tr>
      <td>Attending Physician Statements (APS)</td>
      <td>Table &mdash; PII/PHI</td>
      <td>Clinical statements from treating physicians; normalized into structured underwriting data fields.</td>
    </tr>
    <tr>
      <td>National Credit Bureau (NCB)</td>
      <td>Table &mdash; PII</td>
      <td>Applicant credit profile data for financial risk enrichment. Processed under NCR data handling requirements.</td>
    </tr>
    <tr>
      <td>Mortality &amp; Claims Warehouse</td>
      <td>Table &mdash; Internal</td>
      <td>Historical mortality and claims data. Used to train and benchmark the ML risk scoring model.</td>
    </tr>
    <tr>
      <td>ASISA Industry Mortality Tables</td>
      <td>Table &mdash; Industry</td>
      <td>South African insurance industry mortality benchmarks. No PII/PHI. Read-only reference data.</td>
    </tr>
    <tr>
      <td>DHA Identity Verification API</td>
      <td>Table &mdash; PII</td>
      <td>Government ID verification for FICA KYC/AML compliance. Data not retained beyond the verification event.</td>
    </tr>
    <tr>
      <td>POPIA Consent Registry</td>
      <td>Table &mdash; PII/PHI</td>
      <td>Consent records verified before every health data enrichment step as required by POPIA Chapter 3.</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 2: Data sources accessed by the Insurance Underwriting Intake & Risk Intelligence Agent</em>
</p>

## 4. Tools

The Insurance Underwriting Intake & Risk Intelligence Agent may use the following tools (see Table 3).

<table align="center">
  <thead>
    <tr>
      <th>Tool</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>OCR Document Extractor</td>
      <td>Extracts structured text and data fields from scanned medical, financial, and identity documents submitted as part of the life insurance application.</td>
    </tr>
    <tr>
      <td>NLP Data Parser</td>
      <td>Parses and normalizes unstructured text from Attending Physician Statements (APS) and medical reports into structured underwriting data fields for the risk scoring model.</td>
    </tr>
    <tr>
      <td>ML Risk Scoring API</td>
      <td>Executes the life insurance risk classification model, producing one of five risk tiers: Standard, Rated, Exclusion Required, Postpone, or Decline &mdash; with a confidence score and contributing risk factors.</td>
    </tr>
    <tr>
      <td>DHA Identity Verification API</td>
      <td>Validates South African ID numbers against the Department of Home Affairs for FICA KYC/AML compliance on every new application.</td>
    </tr>
    <tr>
      <td>Credit Bureau Connector</td>
      <td>Retrieves the applicant's credit profile from the National Credit Bureau (NCB) for financial risk enrichment and affordability assessment.</td>
    </tr>
    <tr>
      <td>Mortality Table Lookup</td>
      <td>Queries ASISA industry and internal mortality tables to benchmark applicant risk against portfolio and industry norms.</td>
    </tr>
    <tr>
      <td>PAS Integration API</td>
      <td>Reads new application payloads from the Policy Administration System and writes annotated risk summaries back for downstream processing by the Compliance &amp; Decisioning Agent.</td>
    </tr>
    <tr>
      <td>Audit Trail Logger</td>
      <td>Records all agent actions, data sources accessed, confidence scores, and POPIA consent flags to the centralized audit trail for regulatory explainability and SAM/ORSA reporting.</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 3: Tools used by the Insurance Underwriting Intake & Risk Intelligence Agent</em>
</p>

## 5. Applications

The agent reads new application payloads from the Policy Administration System (PAS) and writes annotated risk summaries back to the PAS via the PAS Integration API for downstream processing. All agent actions, data access events, confidence scores, and POPIA consent flags are written to the Audit Trail & Compliance Logger — the primary governance record for regulatory audit and SAM/ORSA reporting. No other business applications are directly accessed by this agent; the Compliance & Decisioning Agent and Communication Agent handle all other system interactions in the pipeline.

## 6.  Business Processes

The Underwriting Intake & Risk Intelligence Agent is used within the following operational processes:

- New Business Application Intake — end-to-end receipt and initial validation of all new life insurance applications entering the underwriting pipeline
- Underwriting Risk Assessment & ML Scoring — data extraction, enrichment, and ML-driven risk tier classification for each applicant
- Regulatory Compliance Validation — automated LTIA Section 48 non-disclosure checks and POPIA consent verification before each data enrichment step
- Identity Verification (FICA KYC/AML) — DHA identity verification on every application to satisfy FICA KYC obligations

## 7. Regulations

The following regulations govern the Underwriting Intake & Risk Intelligence Agent (see Table 4). The agent carries a Regulatory Risk Score of 7/10 — High Risk, primarily driven by its processing of Protected Health Information (PHI) and Personally Identifiable Information (PII) in the context of life insurance risk assessment, which is explicitly classified as High Risk under EU AI Act Article 6:


<table align="center">
  <thead>
    <tr>
      <th>Regulation</th>
      <th>Requirement</th>
      <th>Agent-Specific Risk</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Long-Term Insurance Act 52 of 1998 (LTIA) &mdash; Section 48</td>
      <td>High Risk &mdash; Material Disclosure</td>
      <td>The agent validates every application against Section 48 non-disclosure and material misrepresentation requirements. Failure to detect non-disclosure before risk scoring would compromise the validity of every downstream underwriting decision.</td>
    </tr>
    <tr>
      <td>POPIA &mdash; Chapter 3 (Special Personal Information)</td>
      <td>High Risk &mdash; Health Data</td>
      <td>All medical and health data processed by the agent constitutes special personal information under POPIA. Unauthorized processing or breach constitutes a notifiable incident reportable to the Information Regulator.</td>
    </tr>
    <tr>
      <td>FICA &mdash; KYC/AML</td>
      <td>High Risk &mdash; Identity Verification</td>
      <td>The agent invokes the DHA Identity Verification API on every application to satisfy FICA KYC obligations. Failure of this step could result in onboarding a fraudulent or sanctioned identity.</td>
    </tr>
    <tr>
      <td>FSCA Conduct Standard for Long-term Insurers</td>
      <td>High Risk &mdash; Market Conduct</td>
      <td>Requires AI-assisted underwriting decisions to be documented, explainable, and subject to oversight. The agent's audit trail and confidence score logging are primary controls for FSCA compliance.</td>
    </tr>
    <tr>
      <td>EU AI Act &mdash; Article 6</td>
      <td>High Risk (Other)</td>
      <td>The agent is used for life insurance risk assessment &mdash; explicitly listed as High Risk under Article 6.</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 4: Regulations governing the Insurance Underwriting Intake & Risk Intelligence Agent</em>
</p>

## 8. Agent Risk Assessment

The Agent Risk Assessment is based on the OWASP AI Vulnerability Scoring System (AIVSS v0.5), evaluating 220+ attributes including technical vulnerabilities, regulatory compliance, and data access privileges. The agent is designated High Risk with a Blended Risk Score of 7.24/10. The risk scores are summarized in Table 5.

<table align="center">
  <thead>
    <tr>
      <th>Risk Dimension</th>
      <th>Score / Classification</th>
      <th>Summary</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Blended Risk Score</td>
      <td style="background-color:#c62828; color:#ffffff; font-weight:700;">6.44 / 10 &mdash; High</td>
      <td>Composite of AIVSS, regulatory exposure, and data sensitivity. Primary drivers: PHI/PII access, High Risk EU AI Act classification, and autonomous ML decisioning.</td>
    </tr>
    <tr>
      <td>AIVSS Score (OWASP)</td>
      <td style="background-color:#c62828; color:#ffffff; font-weight:700;">6.3 / 10 &mdash; High</td>
      <td>Driven by moderate autonomy, goal-driven planning, and dynamic tool use. Conservative scoring on Dynamic Identity and Multi-Agent Interactions due to undocumented controls.</td>
    </tr>
    <tr>
      <td>AARS Score</td>
      <td style="background-color:#ef6c00; color:#ffffff; font-weight:700;">3.5/ 10 &mdash; Medium</td>
      <td>Agentic Autonomous Risk Score reflects bounded autonomy &mdash; agent cannot issue final decisions, is constrained to a predefined toolset, and requires downstream human escalation for non-STP cases.</td>
    </tr>
    <tr>
      <td>Regulatory Risk (EU AI Act)</td>
      <td style="background-color:#c62828; color:#ffffff; font-weight:700;">7 / 10 &mdash; High Risk</td>
      <td>Classified High Risk under Article 6 (insurance risk assessment). Processes PII and PHI. No Article 5 prohibited practices found. POPIA, FICA, LTIA and FSCA obligations are all applicable.</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 5: Agent risk assessment scores</em>
</p>

### 8.1 Business Continuity Assessment

If the Insurance Underwriting Intake & Risk Intelligence Agent fails, the most immediate consequence is the collapse of the automated application intake pipeline, forcing underwriters to revert to fully manual document extraction, data validation, and risk scoring. Without the agent's OCR and NLP extraction capabilities, every medical examination report, APS, financial statement, and identity document would require manual re-keying — precisely the high-volume, error-prone approach the system was designed to replace. The loss of the ML Risk Scoring API would eliminate consistent, objective risk classification, reintroducing inter-underwriter variability in risk decisions. The projected STP rate of 40–65% would collapse to zero, and the target cycle time reduction from 10+ days to under 5 days would be entirely reversed. Downstream agents (Compliance & Decisioning and Communication & Case Management) would receive no input and would also cease to function autonomously.

### 8.2 Legal Risk Assessment

The agent processes the most sensitive categories of personal information in the Insurance underwriting pipeline. Medical examination reports and Attending Physician Statements constitute special personal information under POPIA Chapter 3 — the highest data sensitivity category in South African law. Unauthorized access to, or accidental exposure of, this data constitutes a notifiable breach reportable to the Information Regulator within 72 hours. The agent also accesses applicant identity data via the DHA API and financial profile data via the National Credit Bureau — both categories subject to FICA and NCR data handling obligations. The Credit Bureau Connector and DHA API are external integrations; any misconfiguration of access controls on these APIs could expose insurance companies to joint liability with the data provider. The POPIA Consent Registry is a critical control: if consent is not verified before a health data enrichment step, each unsanctioned processing event constitutes a separate POPIA violation.

### 8.3  Regulatory Risk Assessment

The Tavro regulatory risk assessment assigned a score of 7/10 — High Risk. The agent is classified High Risk under EU AI Act Article 6 on the basis that it is used for life insurance risk assessment, an explicitly listed high-risk application. No Article 5 prohibited practices were identified. PII and PHI are both processed; PCI data is not. Under South African law, the agent's LTIA Section 48 validation function is a primary compliance control — any failure to flag non-disclosure before a risk scoring decision could expose insurance companies to policy avoidance disputes. FSCA Conduct Standard requirements for AI explainability are met through the Audit Trail Logger, which records all decision rationale and confidence scores. FICA KYC obligations are enforced through the mandatory DHA Identity Verification API invocation on every application.

### 8.4  Cybersecurity Risk Assessment — OWASP AIVSS 6.3/10 (High)

The OWASP AIVSS assessment produced a score of 6.3/10 — High Risk — and an AARS (Agentic Autonomous Risk Score) of 3.5/10. The detailed capability breakdown is shown in Table 6. The score is primarily driven by moderate autonomy, goal-driven multi-step planning, and dynamic external API use. These scores represent priority areas for governance improvement.


<table align="center">
  <thead>
    <tr>
      <th>AARS Capability</th>
      <th>Score</th>
      <th>Rationale</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Autonomy of Action</td>
      <td>0.5</td>
      <td>Operates within a fixed set of allowed tools following a hard-coded sequence. No evidence of user approval gating every action, nor arbitrary code execution or recursive self-prompting.</td>
    </tr>
    <tr>
      <td>Goal-Driven Planning</td>
      <td>0.5</td>
      <td>Executes a multi-step process (extraction, validation, enrichment, scoring, logging). No evidence of recursive planning or delegation to other agents.</td>
    </tr>
    <tr>
      <td>Self-Modification</td>
      <td>0.0</td>
      <td>No ability to modify its own code, instructions, or persistent logic. All model updates are performed externally.</td>
    </tr>
    <tr>
      <td>Dynamic Tool Use</td>
      <td>0.5</td>
      <td>Uses a predefined set of external APIs (PAS Integration API, Credit Bureau Connector, DHA Identity Verification API). No dynamic tool invocation or arbitrary write/execute capabilities.</td>
    </tr>
    <tr>
      <td>Memory Use</td>
      <td>0.5</td>
      <td>Logs actions and data to an audit trail and references external data sources. No persistent writable memory or cross-session learning. Not explicitly stated as stateless.</td>
    </tr>
    <tr>
      <td>Contextual Awareness</td>
      <td>0.5</td>
      <td>Accesses curated external data sources (mortality tables, credit bureau, DHA API). No unfiltered internet or real-time event stream access.</td>
    </tr>
    <tr>
      <td>Dynamic Identity</td>
      <td>0.0</td>
      <td>Static identity and permissions. No role switching or permission escalation.</td>
    </tr>
    <tr>
      <td>Multi-Agent Interactions</td>
      <td>0.5</td>
      <td>The agent interacts with other agents via static routing logic, but there is no evidence of dynamic peer discovery.</td>
    </tr>
    <tr>
      <td>Non-Determinism</td>
      <td>0.5</td>
      <td>Produces structured outputs (risk tiers, annotated summaries) and confidence scores, suggesting semi-structured dynamic output fields. No strict schema enforcement documented.</td>
    </tr>
    <tr>
      <td>Opacity &amp; Reflexivity</td>
      <td>0</td>
      <td>The agent logs all actions, data sources, and confidence scores to an audit trail, providing transparency and traceability for regulatory explainability.</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 6: OWASP AIVSS capability breakdown  (AIVSS: 6.3/10, AARS: 3.5/10)</em>
</p>

### 8.5 Statutory Reporting Risk Assessment

The Intake Agent writes risk summaries directly to the Policy Administration System — the source of record for all statutory underwriting returns submitted to the FSCA and SARB. The ML Risk Scoring API produces risk tier classifications that feed into actuarial reserving, regulatory capital calculations under SAM, and insurance ORSA. If the ML model produces systematically biased or inaccurate risk scores — for instance, consistently under-classifying substandard lives as Standard — the resulting policy portfolio could be materially mispriced, distorting insurance’s SAM/ORSA solvency position and FSCA regulatory returns. An AI agent producing flawed or unauditable output from the first step of the pipeline would compromise the integrity of all downstream statutory reporting. Model validation, backtesting against claims experience, and regular recalibration of the ML Risk Scoring API are therefore statutory reporting risk controls, not merely operational quality measures.

### 8.6 Data Risk Assessment

The agent processes PII and PHI across all eight registered data sources — the highest data sensitivity profile of any agent in the three-agent pipeline. All eight tool interactions carry PII:Yes and PHI:Yes. No PCI data is processed. The agent operates under a strict least-privilege access model: each tool is scoped to the minimum data required for its specific function. POPIA consent is verified via the POPIA Consent Registry before every health data enrichment step. Identity data processed via the DHA API is used exclusively for FICA KYC/AML verification and is not retained beyond the verification event. The Audit Trail Logger provides a complete, tamper-evident record of all data access events for POPIA accountability obligations.

## Contributors

[Sunil Soares, Tavro AI](https://www.linkedin.com/in/sunilsoares/)
