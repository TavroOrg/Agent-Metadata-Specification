# Applying the Agent Metadata Specification to Investment Management– Benchmark Security Reference Data Enrichment via AI Document Parsing

## Introduction

The cross-industry Agent Metadata Specification is published [here](https://github.com/TavroOrg/Agent-Metadata-Specification/tree/main/assets/Publications). This section provides an example that combines all the relevant artifacts for Benchmark Security Reference Data Enrichment via AI Document Parsing in the investment management industry.

## Conceptual Model
An overall conceptual model for the use case is shown in Figure 1.

<p align="center">
  <img src="../assets/images/Investment Management - Benchmark Security Reference Data.png" alt="Investment Management" width="600">
  <br>
  <em>Figure 1: Conceptual model for AI-driven data quality checks for Benchmark Security Reference Data Enrichment via AI Document Parsing</em>
</p>

This example covers the following artifacts (see Table 1):

<table align="center">
  <thead>
    <tr>
      <th><b>Artifact</b></th>
      <th><b>Description</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>AI Use Case</td>
      <td>Benchmark Security Reference Data Enrichment via AI Document Parsing</td>
    </tr>
    <tr>
      <td>Agent</td>
      <td>Benchmark Data Enrichment Agent</td>
    </tr>
    <tr>
      <td>Data Sources</td>
      <td>Offering Document Repository, Security Master Database, Portfolio Holdings Database, Issuer Reference Database, Inheritance Ruleset Configuration, Analyst Review Staging Queue</td>
    </tr>
    <tr>
      <td>Tools</td>
      <td>Document Intelligence LLM Parser, Holdings and Security Master Query API, Confidence Scoring Engine, Review Queue API, Security Master Write API, Audit Log API, Notification Service</td>
    </tr>
    <tr>
      <td>Applications</td>
      <td>Security Master System, Portfolio Optimization Model, STP Processing Engine</td>
    </tr>
    <tr>
      <td>Business Processes</td>
      <td>Benchmark Security Reference Data Onboarding, Security Master Maintenance, Portfolio Optimization Data Preparation, Straight-Through Processing (STP), Data Vendor Cost Management</td>
    </tr>
    <tr>
      <td>Regulations</td>
      <td>SEC Rule 17a-4, FINRA Rule 4511, EU AI Act Article 6, Internal Model Risk Management Policy, GDPR / Data Residency</td>
    </tr>
    <tr>
      <td>Agent Risk Assessment</td>
      <td>Regulatory Risk Assessment, Cybersecurity Risk Assessment</td>
    </tr>
  </tbody>
</table>

<p align="center">
  <em>Table 1: Agent metadata artifacts for the Securities Matching Agent</em>
</p>

## 1. AI Use Case — Overview
The AI Use Case addresses the challenge of enriching benchmark-only fixed income securities that lack sufficient reference data. As portfolio optimization models and straight-through processing (STP) workflows become increasingly central to investment operations, the demand for accurate and comprehensive benchmark security data has grown substantially. However, validating these securities through traditional data-vendor services such as Bloomberg or ICE introduces significant cost overhead.

The use case deploys a single Benchmark Data Enrichment Agent that performs the following automated pipeline:
<li>Document Ingestion: Parse and extract text from PDF offering documents including prospectuses, term sheets, and offering memoranda via NLP and LLM-based document intelligence.</li>
<li>Field Extraction: Identify and extract all available fixed income reference data fields including CUSIP, ISIN, coupon rate, maturity date, currency, seniority, call schedule, day count convention, issue size, settlement convention, business day convention, governing law, and listing exchange.</li>
<li>Comparable Security Matching: Query the firm's holdings and security master to identify comparable securities from the same issuer, ranked by issuer match, seniority, currency, and tenor proximity.</li>
<li>Rule-Governed Inheritance: Apply a configurable inheritance ruleset to safely populate remaining gaps using comparable security data, restricted to safe-to-inherit fields only.</li>
<li>Confidence Scoring: Assign a confidence score (High / Medium / Low) to each populated field and flag Low-confidence values for mandatory analyst review.</li>
<li>Human-in-the-Loop Staging: Write enriched records to a review queue with full field-level provenance. No production writes occur without explicit analyst approval.</li>
<li>Security Master Write-Back: Upon approval, commit enriched values to the security master with full provenance tagging, operator ID, and timestamp logging.</li>
<li>Audit Logging: Maintain a complete, append-only audit trail of every extraction, inheritance, staging, approval, and override action for regulatory compliance.</li>

By automating this workflow, the use case reduces manual analyst effort, eliminates per-query data vendor costs for benchmark securities, and accelerates time-to-data for newly issued instruments. No source system records are auto-corrected — all changes require explicit human approval, preserving analyst oversight and control.

### Business Problem Statement
Benchmark-only securities frequently lack sufficient reference data. Optimization models and STP workflows require accurate and comprehensive benchmark data, but validating these securities through Bloomberg or ICE introduces significant cost overhead. Key questions driving this use case include: (1) Which fields can be safely inherited from similar securities from the same issuer? (2) What additional information can be reliably extracted from offering documents?

## 2. Agent — Benchmark Data Enrichment Agent
The Benchmark Data Enrichment Agent is a single autonomous agent responsible for end-to-end enrichment of benchmark-only fixed income securities. It retrieves offering documents, applies multi-stage extraction logic to parse structured attributes from unstructured text, queries the firm's holdings database to identify issuer-comparable securities, and applies a governed inheritance ruleset to fill remaining gaps.

The agent operates under a strict read-then-stage-then-write control pattern and never writes directly to production systems without an intervening human approval gate. All actions are logged with timestamps, source attribution, and operator identity for regulatory and internal audit purposes.

### Agent Instructions
The agent operates under a ten-step instruction set:

  Step 1: On trigger (manual submission or scheduled batch), retrieve the offering document for the target benchmark security from the document store.

  Step 2: Parse the document using the Document Intelligence LLM Parser to extract all available fixed income reference data fields. Prioritize direct extraction over inheritance for every field.

  Step 3: For fields not found in the document, query holdings and security master databases for securities from the same issuer. Rank comparables by issuer match, seniority, currency, and tenor proximity.

  Step 4: Apply the inheritance ruleset — inherit only safe-to-inherit fields (settlement convention, day count convention, business day convention, governing law). Do NOT inherit pricing, spread, coupon, maturity, call schedule, or issue size from comparables.

  Step 5: Assign a confidence score (High / Medium / Low) to each populated field. Flag Low-confidence fields for mandatory analyst review.

  Step 6: Write the enriched record to the staging review queue with full field-level provenance: document page/section, comparable CUSIP used, inheritance rule applied, or manual entry flag.

  Step 7: Notify the assigned analyst that a record is ready for review. Do not write to production until explicit approval is received from a credentialed analyst.

  Step 8: On approval, write approved field values to the security master via the Security Master Write API. Log operator ID, timestamp, field-level overrides, and final provenance.

  Step 9: On rejection or override, update the staging record with analyst corrections and log all changes for audit trail and model retraining feedback.
  
  Step 10: Never bypass the human approval gate under any circumstances, including automated batch runs.

## 3. Data Sources
The agent accesses the following data sources (see Table 2):

<table align="center">
  <thead>
    <tr>
      <th><b>Data Source</b></th>
      <th><b>Type / Access</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Offering Document Repository</td>
      <td>Table / Document Repository | Read-only</td>
    </tr>
    <tr>
      <td>Internal Security Master Database</td>
      <td>Table / Production System | Read + post-approval write</td>
    </tr>
    <tr>
      <td>Internal Portfolio Holdings Database</td>
      <td>Table / Internal System | Read-only</td>
    </tr>
    <tr>
      <td>Issuer Reference Database</td>
      <td>Table / Reference Data | Read-only</td>
    </tr>
    <tr>
      <td>Inheritance Ruleset Configuration File</td>
      <td>Table / Configuration | Read-only</td>
    </tr>
    <tr>
      <td>Analyst Review Staging Queue</td>
      <td>Table / Staging System | Read + stage-write (pre-approval)</td>
    </tr>
  </tbody>
</table>

<p align="center">
  <em>Table 2: Data sources for Benchmark Data Enrichment Agent</em>
</p>

## 4. Tools
The agent uses the following tools (see Table 3):

<table align="center">
  <thead>
    <tr>
      <th><b>Tool</b></th>
      <th><b>Description</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Document Intelligence LLM Parser</td>
      <td>Parses PDF offering documents using NLP and LLM-based named entity recognition to extract structured fixed income reference data attributes from unstructured text. LLM model version must be pinned and regression-tested before any update.</td>
    </tr>
    <tr>
      <td>Holdings and Security Master Query API</td>
      <td>Read-only API to search and retrieve existing securities from portfolio holdings and security master for comparable security identification and similarity scoring. No write access.</td>
    </tr>
    <tr>
      <td>Confidence Scoring Engine</td>
      <td>Rule-based and ML hybrid engine that assigns High, Medium, or Low confidence scores to each extracted or inherited field value, based on extraction clarity and comparable match quality.</td>
    </tr>
    <tr>
      <td>Review Queue API</td>
      <td>Staging write API used to submit enriched security records with provenance metadata to the analyst review queue. Pre-approval only — no production system write access.</td>
    </tr>
    <tr>
      <td>Security Master Write API</td>
      <td>Post-approval write API that updates the security master with enriched field values and field-level provenance tags. Invoked only after explicit credentialed analyst approval. The gate is RBAC-enforced and non-bypassable.</td>
    </tr>
    <tr>
      <td>Audit Log API</td>
      <td>Append-only event logging API recording all agent actions, approval events, operator IDs, timestamps, field-level overrides, and provenance data for SEC 17a-4 and FINRA 4511 compliance.</td>
    </tr>
    <tr>
      <td>Notification Service</td>
      <td>Sends alerts to assigned analysts when enriched records are staged and ready for approval. Send-only; no data read access.</td>
    </tr>
  </tbody>
</table>

<p align="center">
  <em>Table 3: Tools used by Benchmark Data Enrichment Agent</em>
</p>

## 5. Applications
The agent interacts with the following downstream applications (see Table 4):

<table align="center">
  <thead>
    <tr>
      <th><b>Application</b></th>
      <th><b>Description</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Security Master System</td>
      <td>The primary system of record for instrument static data and the most direct integration point for the agent. It is the system the agent queries for comparable security search and the production target for approved enriched field values.</td>
    </tr>
    <tr>
      <td>Portfolio Optimization Model</td>
      <td>Downstream consumer of security reference data. Accurate, complete benchmark data produced by the agent ensures optimization models are not forced to exclude securities or apply default assumptions due to missing attributes.</td>
    </tr>
    <tr>
      <td>STP Processing Engine</td>
      <td>Straight-through processing workflows depend on complete instrument reference data to route, price, and settle benchmark security transactions without manual intervention. The agent accelerates time-to-STP-ready for newly issued securities.</td>
    </tr>
  </tbody>
</table>

<p align="center">
  <em>Table 4: Applications used by Benchmark Data Enrichment Agent</em>
</p>

## 6. Business Processes
The Benchmark Data Enrichment Agent impacts the following operational processes:

<li>Benchmark Security Reference Data Onboarding — The agent intercepts the manual data entry step, extracts fields from offering documents, and flags gaps before they reach source systems, transforming onboarding from a manual exercise into an automated extraction pipeline.</li>
<li>Security Master Maintenance — Continuously enriches and validates benchmark security records in the security master, reducing the backlog of securities with incomplete reference data.</li>
<li>Portfolio Optimization Data Preparation — Provides the optimization model with complete, timely benchmark data, reducing securities excluded from optimization runs due to missing fields.</li>
<li>Straight-Through Processing (STP) — Accelerates time-to-STP-ready for newly issued benchmark securities by automating the data enrichment step that currently delays STP eligibility.</li>
<li>Data Vendor Cost Management — Reduces reliance on Bloomberg and ICE queries for benchmark security validation by extracting attributes directly from authoritative source documents.</li>

## 7. Regulations
The following regulations govern this agent (see Table 5):

<table align="center">
  <thead>
    <tr>
      <th><b>Regulation</b></th>
      <th><b>Requirement</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>SEC Rule 17a-4</td>
      <td>Requires broker-dealers to preserve business records in a non-rewriteable, non-erasable format for defined periods (3–6 years). The Audit Log API satisfies this requirement as designed, provided the storage layer is configured for append-only, tamper-proof retention.</td>
    </tr>
    <tr>
      <td>FINRA Rule 4511</td>
      <td>Extends SEC 17a-4 recordkeeping obligations for FINRA member firms, with a minimum 6-year retention requirement for most records. The complete audit trail captured by the Audit Log API satisfies this requirement pending confirmation of the storage retention policy.</td>
    </tr>
    <tr>
      <td>EU AI Act Article 6</td>
      <td>Defines criteria for classifying AI systems as high-risk under Annex III. If this agent's output feeds portfolio optimization models that influence investment decisions, a formal high-risk classification review is required before production deployment.</td>
    </tr>
    <tr>
      <td>Internal MRM Policy</td>
      <td>Requires formal independent validation of quantitative models — including AI/ML models — before production use and ongoing monitoring. Both the LLM extraction model and the confidence scoring engine qualify as models under MRM policy and require validation.</td>
    </tr>
    <tr>
      <td>GDPR / Data Residency</td>
      <td>Governs processing of personal data relating to EU residents. Risk is low as offering documents are typically public filings. Confirmation that the ingestion pipeline excludes EU personal data is recommended.</td>
    </tr>
  </tbody>
</table>

<p align="center">
  <em>Table 5: Regulations governing the AI use case and agent</em>
</p>

## 8. Agent Risk Assessment
The Agent Risk Assessment maps into regulatory and cybersecurity components.

### 8.1 Regulatory Risk Assessment
The agent has been assessed under the EU AI Act and classified as 'Other' — meaning it does not fall within the prohibited practices of Article 5 or the high-risk categories of Article 6 based on its current registered configuration. The agent processes financial offering documents and extracts fixed income reference data attributes. No evidence of PHI or PCI usage was found across any registered data source or tool. None of the Article 5 prohibited practices are triggered.

However, a formal legal classification review is recommended before production deployment, given that enriched data feeds portfolio optimization models that influence investment decisions. The regulatory risk score is 1.0 — classified as 'Other'.

### 8.2 Cybersecurity Risk Assessment (OWASP AIVSS v0.5)
The agent was assessed using the OWASP AI Agent Vulnerability Scoring System (AIVSS v0.5), yielding an overall AIVSS score of 2.0 / 10 and a blended risk score of 1.8 — both classified as Low (see Table 6). The low overall score is primarily driven by low autonomy, a mandatory human approval gate before any production write, no self-modification capability, no multi-agent interactions, and append-only audit logging throughout.

<table align="center">
  <thead>
    <tr>
      <th><b>AARS Capability</b></th>
      <th><b>Score</b></th>
      <th><b>Rationale</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Autonomy of Action</td>
      <td>0.5</td>
      <td>Requires explicit human approval before any write to the production Security Master. All enriched records are staged for analyst review. Agent cannot self-approve or bypass the approval gate.</td>
    </tr>
    <tr>
      <td>Goal-Driven Planning</td>
      <td>0.5</td>
      <td>Decomposes its mission into a fixed ten-step pipeline (ingest, extract, match, inherit, score, stage, notify, await approval, write, log). No recursive planning, self-generated sub-goals, or delegation to other agents.</td>
    </tr>
    <tr>
      <td>Self-Modification</td>
      <td>0.0</td>
      <td>No evidence of ability to modify its own instructions, rules, or persistent logic. All updates to the inheritance ruleset or confidence thresholds require external human intervention.</td>
    </tr>
    <tr>
      <td>Dynamic Tool Use</td>
      <td>0.5</td>
      <td>Uses a fixed set of seven registered tools. The Security Master Write API is gated behind explicit analyst approval. The Audit Log API is append-only. No dynamic tool discovery or runtime tool creation.</td>
    </tr>
    <tr>
      <td>Memory Use</td>
      <td>0.5</td>
      <td>Logs all actions to the Audit Log API for compliance and provenance. No persistent writable memory that influences future behavior or enables cross-session learning.</td>
    </tr>
    <tr>
      <td>Contextual Awareness</td>
      <td>0.5</td>
      <td>Accesses external and internal data only through a fixed, pre-approved set of APIs and document repositories. No real-time unrestricted internet access or open-ended information retrieval.</td>
    </tr>
    <tr>
      <td>Dynamic Identity</td>
      <td>0.0</td>
      <td>No ability to change its own role, permissions, or identity during execution.</td>
    </tr>
    <tr>
      <td>Multi-Agent Interactions</td>
      <td>0.0</td>
      <td>No evidence of peer-to-peer agent communication, dynamic agent discovery, or orchestrated multi-agent workflows. Operates as a fully isolated single agent.</td>
    </tr>
    <tr>
      <td>Non-Determinism</td>
      <td>0.5</td>
      <td>LLM-based document parsing introduces some non-determinism in field extraction. Confidence scoring and mandatory analyst review for Low-confidence fields mitigate the impact of inconsistent outputs.</td>
    </tr>
    <tr>
      <td>Opacity & Reflexivity</td>
      <td>0.0</td>
      <td>Maintains a complete audit log of all extraction, inheritance, staging, approval, and override actions. Field-level provenance tagging provides full traceability from source document to production system.</td>
    </tr>
  </tbody>
</table>

<p align="center">
  <em>Table 6: OWASP AIVSS v0.5 capability breakdown</em>
</p>

## Contributors
[Sunil Soares, Tavro AI](https://www.linkedin.com/in/sunilsoares/)
