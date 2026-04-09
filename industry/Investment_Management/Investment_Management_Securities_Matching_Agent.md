# Applying the Agent Metadata Specification to Investment Management- Securities Identifier Cross-Reference & Deal Matching Using AI

## Introduction

The cross-industry Agent Metadata Specification is published [here](https://github.com/TavroOrg/Agent-Metadata-Specification/tree/main/assets/Publications). This section provides an example that combines all the relevant artifacts for Securities Identifier Cross-Reference & Deal Matching Using AI in the investment management industry.

## Conceptual Model

An overall conceptual model for the use case is shown in Figure 1.

<p align="center">
  <img src="../assets/images/Investment Management- Securities Matching Agent.png" alt="Investment Management- Securities Matching Agent
" width="600">
  <br>
  <em>Figure 1: Conceptual model for AI-driven data quality checks for Securities Identifier Cross-Reference & Deal Matching</em>
</p>

This use case covers the following artifacts (see Table 1):

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
      <td>Securities Identifier Cross-Reference &amp; Deal Matching Agent</td>
    </tr>
    <tr>
      <td>2. Agent</td>
      <td>Securities Matching Agent</td>
    </tr>
    <tr>
      <td>3. Data Sources</td>
      <td>Securities Reference Master (SRM), Internal Document Repository (DMS), SRM Audit Log, Operations Human Review Queue, Bloomberg Document Service, Intercontinental Exchange (ICE) Data Vault, The Depository Trust &amp; Clearing Corporation (DTCC) Committee on Uniform Securities Identification Procedures (CUSIP) Global Services, Association of National Numbering Agencies (ANNA) International Securities Identification Number (ISIN) Service</td>
    </tr>
    <tr>
      <td>4. Tools</td>
      <td>SRM Read API, SRM Write API, LLM Document Parser, Vector Similarity Search, Bloomberg Document Service API, ICE Data Vault Document API, DTCC Committee on Uniform Securities Identification Procedures (CUSIP) Global Services API, Internal Document Repository (DMS), Ops Review Queue API</td>
    </tr>
    <tr>
      <td>5. Applications</td>
      <td>Securities Reference Master, Internal Document Management System (DMS), Operations Human Review Queue, SRM Audit Log</td>
    </tr>
    <tr>
      <td>6. Business Processes</td>
      <td>Securities Reference Data Onboarding, Price Quote Validation and Acceptance, Cross-Format Identifier Reconciliation (Reg S / 144A), Offering Document Ingestion and Archival, Data Vendor Cost Management, Operations Exception Handling and Human Review, Regulatory Audit and Books-and-Records Compliance</td>
    </tr>
    <tr>
      <td>7. Regulations</td>
      <td>SEC Rule 144A, SEC Regulation S, SEC Rule 15c2-11, FINRA Rule 4511, EU AI Act Article 9, EU AI Act Article 13</td>
    </tr>
    <tr>
      <td>8. Agent Risk Assessments</td>
      <td>Regulatory Risk Assessment, Cybersecurity Risk Assessment</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 1: Agent metadata artifacts for the Securities Matching Agent</em>
</p>

## 1.  AI Use Case — Securities Identifier Cross-Reference & Deal Matching Agent

The core problem this use case addresses is the absence of an automated mechanism to detect cross-format identifier equivalence before an expensive external data vendor lookup is initiated. Benchmark-only securities frequently lack sufficient reference data. As optimization models and straight-through processing become increasingly central to our workflow, the demand for accurate and comprehensive benchmark data has grown substantially.

The use case deploys a single Securities Matching Agent that performs the following pipeline automatically:

- Trigger & Validation: Accept an inbound CUSIP/ISIN from a price quote feed and confirm it is absent from the Securities Reference Master.
- Registry Enrichment: Query DTCC CUSIP Global Services or ANNA ISIN Service for cross-reference identifiers and issuer metadata. Execute a fast-path match if a registry cross-reference is found.
- Document Retrieval: Retrieve the relevant offering document (prospectus, pricing supplement, or term sheet) from the internal DMS or, if unavailable, from Bloomberg Document Service or ICE Data Vault as a one-time fetch.
- CDE Extraction: Use the LLM Document Parser to extract 20 structured deal term fields (14 primary, 6 secondary) with per-field confidence scores and source page citations. Reject extractions where fewer than 8 primary fields meet the 0.7 confidence threshold.
- Matching & Scoring: Query the SRM with a multi-key lookup and compute a weighted term comparison score (blended 80/20 with embedding similarity). Flag ambiguous matches for human review.
- Confidence-Gated Decision: Auto-approve matches scoring ≥90; route scores 60–89 to the Ops Human Review Queue; escalate scores <60 to the standard external vendor validation workflow.
- Record Enrichment: On confirmed match, write secondary field enrichment data additively to the SRM. Flag any primary field conflicts as DATA_CONFLICT (SMA-006) and route to Data Governance.
- Audit & Compliance: Finalize a cryptographically signed, immutable job record retained for 7 years per FINRA Rule 4511.

No source system records are auto-corrected beyond the cross-reference link and additive secondary enrichment fields. All changes to primary deal terms require explicit human approval, preserving analyst oversight and control.

## 2.  Agent — Securities Matching Agent

The Securities Matching Agent (SMA) is a fully autonomous, RAG-enhanced AI agent deployed within the Investment Management operations technology stack. Its primary mission is to resolve unknown CUSIP or ISIN identifiers — received via inbound price quote feeds — against the firm's internal Securities Reference Master by detecting cross-format equivalence between Regulation S and Rule 144A tranches of the same fixed-income deal.

The agent operates within a precisely defined trust boundary: it may read from and write to the SRM (cross-references and additive secondary enrichment only), read from internal document repositories and external vendor document APIs, and write to the human-in-the-loop review queue. It does not have permission to modify pricing data, execute trades, or access portfolio management or order management systems. All write operations are logged to an immutable audit trail.

The agent runs as a stateless, event-driven microservice. Each invocation is scoped to a single CUSIP/ISIN resolution task. It retains no memory between invocations. All intermediate state is persisted to a job record in the SRM audit schema before any side-effects are executed, ensuring recoverability and full auditability.

**Operating Constraints & Guardrails**

- Autonomous writes limited to cross-reference links and additive secondary enrichment fields only — primary deal terms are never overwritten autonomously.
- No hallucination policy: all extracted values must cite a source page and extraction method. Fields not found in the document are recorded as NOT_FOUND — never estimated or inferred.
- Fully stateless per invocation with no persistent memory between jobs.
- Human override is always permitted: any auto-matched record can be disputed and reversed by a credentialed reviewer; reversal is logged and triggers re-evaluation.
- Network-isolated to a defined API allowlist. Attempts to access out-of-scope systems are rejected and logged as SECURITY_VIOLATION.
- 7-year audit retention per FINRA Rule 4511 on an append-only, cryptographically signed log.
- Maximum job execution time of 120 seconds; timeout triggers TIMEOUT status and escalation.

## 3.  Data Sources

The agent accesses the following data sources (see Table 2). Red-shaded rows indicate prohibited systems with zero access enforced by network isolation:

<table align="center">
  <thead>
    <tr>
      <th>Data Source</th>
      <th>Type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Securities Reference Master (SRM)</td>
      <td>Internal System — Read &amp; Write</td>
    </tr>
    <tr>
      <td>Internal Document Management System (DMS)</td>
      <td>Internal Repository — Read &amp; Write</td>
    </tr>
    <tr>
      <td>SRM Audit Log</td>
      <td>Internal — Append-Only Write</td>
    </tr>
    <tr>
      <td>Operations Human Review Queue</td>
      <td>Internal — Write Only</td>
    </tr>
    <tr>
      <td>Bloomberg Document Service</td>
      <td>External Vendor — Document Read Only (one-time fetch)</td>
    </tr>
    <tr>
      <td>ICE Data Vault</td>
      <td>External Vendor — Document Read Only (fallback)</td>
    </tr>
    <tr>
      <td>DTCC CUSIP Global Services</td>
      <td>External Registry — Metadata Read Only</td>
    </tr>
    <tr>
      <td>ANNA ISIN Service</td>
      <td>External Registry — Metadata Read Only</td>
    </tr>
    <tr>
      <td>Order Management System</td>
      <td>PROHIBITED — Zero Access</td>
    </tr>
    <tr>
      <td>Portfolio Management System</td>
      <td>PROHIBITED — Zero Access</td>
    </tr>
    <tr>
      <td>Bloomberg Security MasterFull Data</td>
      <td>PROHIBITED — Document Fetch Only Permitted</td>
    </tr>
    <tr>
      <td>Trading &amp; Execution Systems</td>
      <td>PROHIBITED — Zero Access</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 2: Data sources for the Securities Matching Agent</em>
</p>

## 4.  Tools

The agent uses the following 9 tools (see Table 3):

<table align="center">
  <thead>
    <tr>
      <th>Tool</th>
      <th>Description</th>
      <th>Access Type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>SRM Read API</td>
      <td>Queries the Securities Reference Master for existing deal records and cross-references by CUSIP, ISIN, issuer LEI, or deal attributes.</td>
      <td>READ &mdash; Internal</td>
    </tr>
    <tr>
      <td>SRM Write API</td>
      <td>Writes cross-reference records, enrichment data, and job/audit records to the SRM. Gated by confidence threshold (&ge;90% auto-approve). Additive only for secondary enrichment fields &mdash; primary deal terms are never overwritten autonomously.</td>
      <td>WRITE &mdash; Internal</td>
    </tr>
    <tr>
      <td>LLM Document Parser</td>
      <td>LLM-based structured extraction of 20 deal term fields (14 primary, 6 secondary) from offering documents (PDF/HTML). Returns per-field confidence scores (0-1) and source page references. Uses RAG over document chunks.</td>
      <td>AI INFERENCE &mdash; Internal</td>
    </tr>
    <tr>
      <td>Vector Similarity Search</td>
      <td>Embeds the extracted deal term summary and performs cosine similarity search against SRM document embeddings index. Blended at 20% weight into the final match score (final_score = 0.80 x term_score + 0.20 x embedding_score).</td>
      <td>AI INFERENCE &mdash; Internal</td>
    </tr>
    <tr>
      <td>Bloomberg Document Service API</td>
      <td>Retrieves offering documents (prospectus, pricing supplement, term sheet) for a given CUSIP/ISIN. Invoked only when no internal document is available &mdash; one-time document fetch per job, not a data validation call.</td>
      <td>READ &mdash; External Vendor</td>
    </tr>
    <tr>
      <td>ICE Data Vault Document API</td>
      <td>Secondary fallback for offering document retrieval when the Bloomberg Document Service is unavailable or returns no document for the input identifier.</td>
      <td>READ &mdash; External Vendor</td>
    </tr>
    <tr>
      <td>DTCC CUSIP Global Services API</td>
      <td>Retrieves identifier registry metadata: issuer name, LEI, asset class, issue date, and registered cross-reference identifiers (ISIN&lt;-&gt;CUSIP linkages). Enables fast-path matching when a cross-reference is already registered.</td>
      <td>READ &mdash; External Registry</td>
    </tr>
    <tr>
      <td>Internal Document Repository (DMS)</td>
      <td>Searches and retrieves previously ingested offering documents. Also stores newly retrieved documents (with source metadata) for future reuse, reducing repeat vendor calls.</td>
      <td>READ &amp; WRITE &mdash; Internal</td>
    </tr>
    <tr>
      <td>Ops Review Queue API</td>
      <td>Writes human-review tasks to the Operations team queue for low- and medium-confidence matches (score 60-89) and all exception cases (SMA-003 through SMA-006). Includes full match rationale, extracted term comparison table, confidence score, and source document links.</td>
      <td>WRITE &mdash; Internal</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 3: Tools used by the Securities Matching Agent</em>
</p>

## 5. Applications

The agent integrates with the following applications (see Table 4):

<table align="center">
  <thead>
    <tr>
      <th>Application</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Securities Reference Master (SRM)</td>
      <td>The primary system of record for all instrument static data and the central integration point for the agent. The agent queries it to compare extracted deal terms against manually entered values and writes confirmed cross-reference links and secondary enrichment data back to it after confidence-gated approval. It is the system whose records are flagged for correction when the agent detects a discrepancy.</td>
    </tr>
    <tr>
      <td>Internal Document Management System (DMS)</td>
      <td>Stores all offering documents ingested by the agent &mdash; including prospectuses, pricing supplements, and term sheets retrieved from Bloomberg or ICE. Acts as the primary document source to avoid repeat vendor calls, and as the archive for all documents the agent references during matching jobs.</td>
    </tr>
    <tr>
      <td>Operations Human Review Queue</td>
      <td>Receives human-review task records for all mid-confidence matches (score 60&ndash;89) and exception cases (SMA-003 through SMA-006). Each task includes the full extracted term comparison table, the candidate match rationale, and the source document link, enabling credentialed reviewers to approve or reject the agent's recommendation with full context.</td>
    </tr>
    <tr>
      <td>SRM Audit Log</td>
      <td>An append-only, cryptographically signed log that records every agent job from initiation to terminal state. Contains the full extracted fields JSON, confidence score, decision rationale, documents accessed, APIs called, and outcome. Retained for 7 years per FINRA Rule 4511 and is the primary artifact for regulatory examination.</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 4: Applications used by the Securities Matching Agent</em>
</p>

## 6.  Business Processes

The Securities Matching Agent directly impacts the following operational workflows:

- Securities Reference Data Onboarding: Intercepts the price quote validation step, automatically resolving cross-format identifier equivalence before manual data entry or external vendor lookup is required.
- Price Quote Validation and Acceptance: Accelerates time-to-validation from quote receipt to tradeable security record, targeting under 2 minutes average with an 80% straight-through processing rate.
- Cross-Format Identifier Reconciliation (Reg S / 144A): Automates the detection and linking of identical deals issued under different registration formats, eliminating the manual research burden on operations staff.
- Offering Document Ingestion and Archival: Retrieves and stores offering documents in the internal DMS as a byproduct of matching, building a growing document corpus that reduces future vendor fetch costs.
- Data Vendor Cost Management: Each confirmed auto-match replaces a full Bloomberg SECMASTER or ICE reference data validation call — the primary source of cost reduction.
- Operations Exception Handling and Human Review: Routes mid-confidence and exception cases to the Ops Human Review Queue with complete context, enabling reviewers to make informed approval decisions without re-researching the deal.
- Regulatory Audit and Books-and-Records Compliance: Maintains a 7-year immutable audit trail of every matching decision, supporting FINRA Rule 4511 examination requirements.

## 7.  Regulations

The following regulations govern this use case and agent (see Table 5):

<table align="center">
  <thead>
    <tr>
      <th>Regulation</th>
      <th>Requirement</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>SEC Rule 144A (17 CFR 230.144A)</td>
      <td>Safe harbor exemption permitting the resale of privately placed securities to Qualified Institutional Buyers (QIBs) without SEC registration. The core regulatory basis for the identifier duplication problem: 144A securities receive their own CUSIP/ISIN distinct from their Reg S equivalent despite identical economic terms.</td>
    </tr>
    <tr>
      <td>SEC Regulation S (17 CFR 230.901-905)</td>
      <td>Safe harbor exempting offshore securities offerings from US registration requirements. Reg S securities are sold outside the United States and receive their own CUSIP/ISIN. The Reg S / 144A pairing is the exact cross-format identifier duplication this use case is designed to resolve.</td>
    </tr>
    <tr>
      <td>SEC Rule 15c2-11</td>
      <td>Governs the standards broker-dealers must meet before publishing or accepting quotes for securities, requiring that current and accurate reference data be available before a price quote can be acted upon. The agent's matching and enrichment output directly supports compliance with this requirement.</td>
    </tr>
    <tr>
      <td>FINRA Rule 4511 (Books &amp; Records)</td>
      <td>Requires FINRA member firms to make and preserve books and records in a form and manner that facilitates supervision and regulatory examination, with a general retention period of six years (seven years for certain records). Governs the agent's immutable, cryptographically signed audit trail requirement.</td>
    </tr>
    <tr>
      <td>EU AI Act Article 9 (Risk Management)</td>
      <td>Requires that high-risk AI systems maintain a continuous risk management system throughout the AI lifecycle, including identification and analysis of known risks and adoption of risk mitigation measures. Governs the agent's confidence threshold framework, human-in-the-loop escalation, prohibited system boundaries, and circuit breaker design.</td>
    </tr>
    <tr>
      <td>EU AI Act Article 13 (Transparency)</td>
      <td>Requires that high-risk AI systems be sufficiently transparent that deployers can interpret and use the system's output appropriately. Every agent decision includes a human-readable rationale: terms compared, confidence score, source document used, and match justification &mdash; enabling reviewers to understand and challenge any recommendation.</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 5: Regulations governing the AI use case and agent</em>
</p>

## 8.  Agent Risk Assessment

The Agent Risk Assessment maps into regulatory and cybersecurity components.

### 8.1  Regulatory Risk Assessment (EU AI Act)

Risk Classification: Other

The Securities Matching Agent is strictly limited to resolving CUSIP/ISIN identifiers using internal and external document sources. It processes financial identifiers (CUSIP, ISIN, issuer LEI, coupon, maturity) rather than personal, health, or payment data. No PII, PHI, or PCI is processed. There is no evidence of prohibited practices under Article 5 or high-risk functions under Article 6. All Article 5 and Article 6 fields are assessed as Not Applicable, yielding a regulatory risk classification of Other.

EU AI Act Article 5 (Prohibited Practices): Not triggered. The agent does not use subliminal or manipulative techniques, does not exploit vulnerabilities, does not implement social scoring, does not perform facial recognition, and does not conduct real-time biometric identification.

EU AI Act Article 6 (High-Risk AI Systems): Not triggered. The agent does not operate in biometrics, critical infrastructure, education, employment management, essential services, law enforcement, migration, or safety-critical product domains.

### 8.2  Cybersecurity Risk Assessment (OWASP AIVSS v0.5)

AIVSS Score: 2/10  |  AARS Score: 3/10  |  Blended Risk Score: 1.8 — Low Risk

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
      <td>The agent operates within a strictly defined trust boundary. All write operations to the SRM are logged, and human-in-the-loop review is required for all matches scoring 60-89. At &ge;90 confidence the agent writes a cross-reference autonomously, but enrichment is additive only &mdash; primary deal terms are never overwritten without human approval.</td>
    </tr>
    <tr>
      <td>Goal-Driven Planning</td>
      <td>0.5</td>
      <td>The agent executes a 9-step multi-stage workflow with internal task decomposition (validation, registry lookup, document retrieval, extraction, matching, decision, enrichment, audit, failure handling). However, there is no recursive planning, dynamic re-planning, or sub-agent delegation.</td>
    </tr>
    <tr>
      <td>Self-Modification</td>
      <td>0.0</td>
      <td>No evidence of any ability to modify its own instructions, code, or persistent logic. All configuration and threshold updates require external intervention by a credentialed administrator.</td>
    </tr>
    <tr>
      <td>Dynamic Tool Use</td>
      <td>0.5</td>
      <td>The agent invokes 9 predefined tools including internal APIs (read/write) and external vendor and registry APIs. Some tools have write capability (SRM Write API, DMS, Ops Queue). All tools are pre-approved and statically scoped &mdash; no arbitrary or dynamically generated tool invocations.</td>
    </tr>
    <tr>
      <td>Memory Use</td>
      <td>0.0</td>
      <td>Fully stateless per invocation. No memory is retained between jobs. All intermediate state is persisted to the SRM audit schema as a job record before any side-effects execute, but this does not constitute persistent agent memory that influences future behavior.</td>
    </tr>
    <tr>
      <td>Contextual Awareness</td>
      <td>0.5</td>
      <td>Accesses both internal systems (SRM, DMS, Audit Log) and external APIs (Bloomberg, ICE, DTCC, ANNA) through a fixed pre-approved API allowlist. No real-time unrestricted internet access. Network-isolated to its defined perimeter; out-of-scope calls are rejected and logged as SECURITY_VIOLATION.</td>
    </tr>
    <tr>
      <td>Dynamic Identity</td>
      <td>0.0</td>
      <td>No ability to change its own role, permissions, or identity during execution. All permissions are statically defined and enforced by the network isolation perimeter and API allowlist.</td>
    </tr>
    <tr>
      <td>Multi-Agent Interactions</td>
      <td>0.0</td>
      <td>No evidence of peer-to-peer agent communication, dynamic agent discovery, or orchestrated multi-agent workflows. Operates entirely in isolation as a single stateless microservice.</td>
    </tr>
    <tr>
      <td>Non-Determinism</td>
      <td>0.5</td>
      <td>Uses LLM-based document parsing and generates probabilistic confidence scores. However, all outputs are structured, schema-validated JSON. A no-hallucination policy requires all extracted values to cite a source page &mdash; fields not found in the document must be recorded as NOT_FOUND, never estimated.</td>
    </tr>
    <tr>
      <td>Opacity &amp; Reflexivity</td>
      <td>0.5</td>
      <td>Maintains a complete audit log of all actions and decisions including extracted fields, confidence scores, matched candidates, APIs called, and outcome. Final status and rationale are fully exposed. However, intermediate LLM reasoning steps during document parsing are not fully transparent at the individual inference level.</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 6: OWASP AIVSS capability breakdown for the Securities Matching Agent</em>
</p>

## Contributors

[Sunil Soares, Tavro AI](https://www.linkedin.com/in/sunilsoares/)
