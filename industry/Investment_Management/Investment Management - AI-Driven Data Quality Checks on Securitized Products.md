# Applying the Agent Metadata Specification to Investment Management – AI-Driven Data Quality Checks for Securitized Products Using Unstructured Data Extracted from Documents

## Introduction

The cross-industry Agent Metadata Specification is published [here](https://github.com/TavroOrg/Agent-Metadata-Specification/tree/main/assets/Publications). This section provides an example that combines all the relevant artifacts for AI-driven data quality checks for securitized products in the investment management industry.

## Conceptual Model

An overall conceptual model for the use case is shown in Figure 1.

<p align="center">
  <img src="../../assets/images/Investment%20Management%20%E2%80%93%20AI-Driven%20Data%20Quality%20Checks%20For%20Securitized%20Products.png" alt="Investment Management – AI-Driven Data Quality Checks For Securitized Products" width="600" >
  <br>
  <em>Figure 1: Conceptual model for AI-driven data quality checks for securitized products using unstructured data</em>
</p>

This example covers the following artifacts (see Table 1):

<table align="center">
  <thead>
    <tr>
      <th>Artifacts</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>AI Use Case</td>
      <td>
        <ul>
          <li>AI-Driven Data Quality Checks on Securitized Products Using Unstructured Data extracted from documents</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Agent</td>
      <td>
        <ul>
          <li>Securitized Product Data Quality Agent</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Data Sources</td>
      <td>
        <ul>
          <li>Multiple including offering circulars, prospectuses, supplements, etc.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Tools</td>
      <td>
        <ul>
          <li>Multiple tools including <code>document_parser_ocr</code>, <code>llm_ner_extractor</code>, and <code>fibo_ontology_lookup</code></li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Applications</td>
      <td>
        <ul>
          <li>Snowflake</li>
          <li>Order and Execution Management System (OEMS)</li>
          <li>Investment Book of Record (IBOR)</li>
          <li>Accounting Book of Record (ABOR)</li>
          <li>Middle/Back-Office Systems</li>
          <li>Securities Reference Master</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Business Processes</td>
      <td>
        <ul>
          <li>Concentration Risk Assessment</li>
          <li>Securitized Product Onboarding</li>
          <li>Securities Reference Data Acquisition</li>
          <li>Securities Reference Data Quality Control</li>
          <li>Fixed Income Research</li>
          <li>Automated Execution</li>
          <li>Alpha Generation</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Regulations</td>
      <td>
        <ul>
          <li>EU AI Act Article 6</li>
          <li>SEC Rule 144A</li>
          <li>SEC Regulation S</li>
          <li>Digital Operational Resilience Act (DORA)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Agent Risk Assessments</td>
      <td>
        <ul>
          <li>Regulatory Risk Assessment</li>
          <li>Cybersecurity Risk Assessment</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 1: Agent metadata artifacts for Securitized Product Data Quality Agent</em>
</p>

## 1. AI Use Case – AI-Driven Data Quality Checks on Securitized Products Using Unstructured Data Extracted from Documents

The AI Use Case addresses the challenge of maintaining high-quality, auditable securities reference data for an investment management firm. The use case centers on the automated ingestion, extraction, and validation of Critical Data Elements (CDEs) from documents governing securitized products — including Offering Circulars, Prospectuses, Supplements, and Indentures. These documents serve as the authoritative source of truth for complex financial instruments such as mortgage-backed securities (MBS), asset-backed securities (ABS), collateralized loan obligations (CLOs), and other securitized product offerings.

The core problem this use case solves is the manual, error-prone nature of extracting data from dense legal and financial documents. Investment management firms rely on accurate reference data for risk management, valuations, execution management, portfolio management, regulatory reporting, and accounting. Errors in Critical Data Elements — such as an incorrect maturity date, index, floating rate spread, embedded optionality, legal jurisdiction, etc. — can propagate into risk figures, compliance reports, and client statements with material financial and regulatory consequences.

The use case deploys a single Securitized Product Data Quality Agent that performs the following pipeline automatically:

1. Document Ingestion: Parse and extract text from PDF, Word, and HTML source documents via NLP.
2. CDE Extraction: Use LLM-based Named Entity Recognition to identify and extract all defined Critical Data Elements.
3. FIBO Ontology Mapping: Map each extracted CDE to its canonical Financial Industry Business Ontology (FIBO) class.
4. Source System Validation: Query the Order Management System (OMS) and Risk Data Warehouse to compare extracted values against existing records.
5. Discrepancy Classification: Apply the validation rule engine to classify discrepancies by severity: Critical, High, Medium, or Informational.
6. Exception Reporting: Generate structured exception reports with document citations (page and section references).
7. Analyst Task Creation: For Critical and High discrepancies, automatically create analyst tasks in the operations workflow system.
8. Data Lineage Logging: Maintain a complete, auditable log of every extraction, mapping, and validation action.

By automating this workflow, the use case reduces manual analyst effort, accelerates time-to-data for newly issued securities. Critically, no source system records are auto-corrected; all changes require explicit human approval, preserving analyst oversight and control.

## 2. Agent – Securitized Data Quality Agent

The Securitized Data Quality Agent is a single autonomous AI agent deployed by a buy-side investment management firm. Its primary mission is to ensure the integrity of the firm's securities reference data by processing unstructured securitized product documents and performing automated validation against source system records.

The agent ingests documents including Offering Circulars, Prospectuses, Supplements, Term Sheets, Indentures, and other relevant deal documents — and extracts more than 100 Critical Data Elements (CDEs) such as CUSIP, ISIN, offering type (144A/Reg S), instrument/deal type, issuer legal name, issuer LEI, tranche/class, principal amount, currency, coupon type, reference rate/index, credit spread, maturity date, seniority/capital tier, credit ratings, governing law, co-lead bookrunners, trustee, write-down/conversion mechanisms, companion CUSIPs, collateral type, etc.

The agent operates under a precise seven-step instruction set: (1) Extract all CDEs from source documents including identifiers, financial terms, and structural attributes; (2) Map each element to its canonical FIBO ontology class across SEC, FBC, IND, and BE modules; (3) Query the source system for existing instrument records; (4) Apply the validation rule engine to compare extracted vs. recorded values; (5) Classify discrepancies by severity — Critical, High, Medium, or Informational; (6) Generate structured exception reports with document citations; and (7) For Critical/High discrepancies, create analyst tasks in the operations workflow system. The agent never auto-corrects source system records without explicit human approval.


## 3. Data Sources

The agent accesses the following data tables and repositories (see Table 2):

<table align="center">
  <thead>
    <tr>
      <th>Data Source</th>
      <th>Type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Offering Circulars (PDF/HTML/Word – Document Management System)</td>
      <td>Table / Document Repository</td>
    </tr>
    <tr>
      <td>Prospectuses (PDF/HTML/Word – Document Management System)</td>
      <td>Table / Document Repository</td>
    </tr>
    <tr>
      <td>Supplements (PDF/HTML/Word – Document Management System)</td>
      <td>Table / Document Repository</td>
    </tr>
    <tr>
      <td>Indentures and Term Sheets (PDF/HTML/Word)</td>
      <td>Table / Document Repository</td>
    </tr>
    <tr>
      <td>Order Management System (OMS – read-only)</td>
      <td>Table / System</td>
    </tr>
    <tr>
      <td>Risk Data Warehouse (read-only)</td>
      <td>Table / System</td>
    </tr>
    <tr>
      <td>Portfolio Accounting System (read-only)</td>
      <td>Table / System</td>
    </tr>
    <tr>
      <td>Bloomberg Terminal / BVAL Data Feeds</td>
      <td>Table / External Feed</td>
    </tr>
    <tr>
      <td>FIBO Ontology Repository (EDM Association – semantic mapping reference)</td>
      <td>Table / Reference Data</td>
    </tr>
    <tr>
      <td>CUSIP Global Services / ANNA (ISIN/CUSIP Lookups)</td>
      <td>Table / External Service</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 2: Data sources for Securitized Product Data Quality Agent</em>
</p>

## 4. Tools

The Agent uses the following tools (see Table 3):

<table align="center">
  <thead>
    <tr>
      <th>Tool</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>document_parser_ocr</code></td>
      <td>Parses and extracts text from PDF, Word, and HTML securitized product documents using OCR (e.g., AWS Textract or Azure Document Intelligence)</td>
    </tr>
    <tr>
      <td><code>llm_ner_extractor</code></td>
      <td>LLM-based Named Entity Recognition engine for extracting Critical Data Elements from parsed document text</td>
    </tr>
    <tr>
      <td><code>knowledge_graph</code></td>
      <td>A knowledge graph built on FIBO triples could represent the relationships between instruments, issuers, CUSIPs, tranches, and capital tiers as a connected network, enabling the agent to traverse links — for example, from a 144A CUSIP node to its Reg S companion — and detect structural anomalies that a flat relational query would miss</td>
    </tr>
    <tr>
      <td><code>rag</code></td>
      <td>Rather than relying solely on the LLM's parametric knowledge, retrieval-augmented generation (RAG) allows the agent to retrieve the relevant clauses, pages, and sections of an Offering Circular at inference time, grounding each CDE extraction and exception explanation in the actual source document text rather than a generalized model response.</td>
    </tr>
    <tr>
      <td><code>semantic_types</code></td>
      <td>By assigning semantic types to extracted values — for example, tagging "Term SOFR" as a ReferenceInterestRate, "5.125%" as a ContingentCapitalTrigger, and "Class A-1" as a TrancheOfDebt — the agent can apply type-aware validation rules that go beyond string matching and catch logically inconsistent entries such as a floating rate bond recorded with a fixed coupon type.</td>
    </tr>
    <tr>
      <td><code>fibo_ontology_lookup</code></td>
      <td>API to look up and map extracted CDEs to canonical FIBO ontology classes and properties</td>
    </tr>
    <tr>
      <td><code>source_system_query_api</code></td>
      <td>Read-only API to query OMS and Risk Data Warehouse for existing instrument records to compare against extracted values</td>
    </tr>
    <tr>
      <td><code>validation_rule_engine</code></td>
      <td>Configurable rule engine that compares extracted CDEs against source system records and classifies discrepancies by severity</td>
    </tr>
    <tr>
      <td><code>bloomberg_reference_data_api</code></td>
      <td>API to Bloomberg BVAL for reference pricing, benchmark rate data, and instrument identifiers</td>
    </tr>
    <tr>
      <td><code>cusip_isin_lookup</code></td>
      <td>API to CUSIP Global Services and ANNA for identifier validation and 144A/Reg S companion CUSIP resolution</td>
    </tr>
    <tr>
      <td><code>workflow_ticketing_api</code></td>
      <td>Creates and routes exception tickets to operations analyst queue with AI-generated explanations and remediation suggestions</td>
    </tr>
    <tr>
      <td><code>data_lineage_logging_service</code></td>
      <td>Logs all extraction, mapping, and validation actions with document citations</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 3: Tools used by the Securitized Product Data Quality Agent</em>
</p>

## 5. Applications

The Agent uses the following applications (see Table 4):

<table align="center">
  <thead>
    <tr>
      <th>Application</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Snowflake</td>
      <td>Serves as the cloud data warehouse that stores the firm's securities reference data, risk positions, and validated CDE records, providing the agent with a queryable, centralized source of truth against which extracted deal document data is compared during validation - and into which remediated records are written after human approval</td>
    </tr>
    <tr>
      <td>Order and Execution Management System (OEMS)</td>
      <td>OEMS is queried in read-only mode by the agent to retrieve existing instrument records at the point of trade order creation, allowing the agent to detect discrepancies between what was manually keyed into the system and what the Offering Circular or Term Sheet actually specifies before erroneous data influences execution decisions</td>
    </tr>
    <tr>
      <td>Investment Book of Record (IBOR)</td>
      <td>The IBOR, which maintains the real-time view of the portfolio's positions and valuations used by portfolio managers and risk teams, is an indirect downstream beneficiary - accurate, validated instrument classifications and reference data produced by the agent ensure that position-level data in the IBOR reflects the correct capital tier, coupon type, and identifier linkages.</td>
    </tr>
    <tr>
      <td>Accounting Book of Record (ABOR)</td>
      <td>The ABOR, which holds the official accounting representation of the portfolio for Net Asset Value (NAV) calculation, financial reporting, and audit purposes, depends on correct instrument master data flowing from source systems - misclassified AT1 bonds or incorrect coupon types caught by the agent prevent accounting errors that would otherwise require costly restatements</td>
    </tr>
    <tr>
      <td>Middle/Back-Office Systems</td>
      <td>Middle and back-office platforms - covering trade settlement, corporate actions processing, collateral management, and reconciliation - consume securities reference data from the same source systems the agent validates, meaning that CDE errors caught upstream by the agent prevent failed settlements, incorrect coupon accruals, and reconciliation breaks downstream</td>
    </tr>
    <tr>
      <td>Securities Reference Master</td>
      <td>The Securities Reference Master is the primary system of record for instrument static data and is the most direct integration point for the agent - it is the source the agent queries to compare extracted CDEs against manually entered values, and it is the system whose records are flagged for correction when the agent detects a discrepancy, making it the central node in the agent's validation workflow</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 4: Applications used by the Securitized Product Data Quality Agent</em>
</p>

## 6. Business Processes – Concentration Risk Assessment / Securitized Product Onboarding

The Securitized Product Data Quality Agent impacts a number of operational processes:

- Concentration Risk Assessment – Misclassified AT1/CoCo bonds directly corrupt capital tier concentration limits
- Securitized Product Onboarding – Intercepts the manual data entry step, extracts CDEs from Offering Circulars and Prospectus Supplements, and flags discrepancies before they are committed to source systems
- Securities Reference Data Acquisition – Transforms reference data acquisition from a manual, error-prone transcription exercise into an automated extraction pipeline
- Securities Reference Data Quality Control – Continuously compares extracted CDEs against system-of-record entries across the OMS, Securities Reference Master, and Risk Data Warehouse
- Fixed Income Research – Provides fixed income analysts with clean, reliable instrument data as the foundation for yield analysis, relative value comparisons, and credit research
- Automated Execution – Automated execution strategies that rely on instrument classifications, identifier lookups, and reference rate data to route and price orders are directly protected by the agent
- Alpha Generation – Clean, standardized, and correctly classified reference data enables portfolio managers and quantitative researchers to construct more accurate risk factor models, concentration analyses, and relative value signals


## 7. Regulations

The following regulations may govern this agent (see Table 5).

<table align="center">
  <thead>
    <tr>
      <th>Regulation</th>
      <th>Requirement</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>EU AI Act Article 6</td>
      <td>High-Risk AI Systems - The agent is classified as 'Other'</td>
    </tr>
    <tr>
      <td>SEC Rule 144A</td>
      <td>Governs private resale of securities to qualified institutional buyers</td>
    </tr>
    <tr>
      <td>SEC Regulation S</td>
      <td>Governs offshore offerings of securities not registered under the Securities Act</td>
    </tr>
    <tr>
      <td>Digital Operational Resilience Act (DORA)</td>
      <td>Requires ICT risk management, incident reporting, and operational resilience for AI and automated systems in financial services</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 5: Regulations governing the AI use case and agent</em>
</p>

## 8. Agent Risk Assessment

The Agent Risk Assessment maps into regulatory and cybersecurity components.

### 8.1 Regulatory Risk Assessment

The agent has been assessed under the EU AI Act and classified as 'Other' — meaning it does not fall within the prohibited practices of Article 5 or the high-risk categories of Article 6. The agent processes financial documents and extracts identifiers such as CUSIP, ISIN, issuer legal name, and LEI, which are considered financial identifiers rather than personal data. No evidence of PHI or PCI usage was found. None of the Article 5 prohibited practices or Article 6 high-risk categories are triggered based on the agent's description and properties.

### 8.2 Cybersecurity Risk Assessment

The agent was assessed using the OWASP AI Agent Vulnerability Scoring System (AIVSS v0.5), yielding an overall AIVSS score of 2.9/10 and an Agentic Autonomous Risk Score (AARS) of 3.5 (see Table 6). The low overall score is primarily driven by low autonomy, no self-modification, and limited dynamic tool use, with all exception tasks requiring human review.

<table align="center">
  <thead>
    <tr>
      <th>Capability</th>
      <th>Score</th>
      <th>Summary</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Autonomy of Action</td>
      <td>0.5</td>
      <td>Requires explicit human approval before any correction to source system records. All exception tasks are routed to analysts for review.</td>
    </tr>
    <tr>
      <td>Goal-Driven Planning</td>
      <td>0.5</td>
      <td>Decomposes mission into multiple steps (extraction, mapping, validation, reporting), but no recursive planning or delegation to other agents.</td>
    </tr>
    <tr>
      <td>Self-Modification</td>
      <td>0.0</td>
      <td>No evidence of ability to modify its own code, instructions, or persistent logic. All updates require external intervention.</td>
    </tr>
    <tr>
      <td>Dynamic Tool Use</td>
      <td>0.5</td>
      <td>Agent tools include both internal and external APIs. Source system query API is read-only; workflow ticketing API creates tickets but does not perform direct writes to core systems.</td>
    </tr>
    <tr>
      <td>Memory Use</td>
      <td>0.5</td>
      <td>Logs all actions for audit trail compliance via data_lineage_logging_service, but no persistent, writable memory that influences future behavior or cross-session learning.</td>
    </tr>
    <tr>
      <td>Contextual Awareness</td>
      <td>0.5</td>
      <td>Accesses external data sources (Bloomberg, CUSIP, FIBO, etc.) only through a fixed set of APIs. No real-time unrestricted internet access.</td>
    </tr>
    <tr>
      <td>Dynamic Identity</td>
      <td>0.0</td>
      <td>No ability to change its own role, permissions, or identity during execution. All permissions appear static and hardcoded.</td>
    </tr>
    <tr>
      <td>Multi-Agent Interactions</td>
      <td>0.0</td>
      <td>No evidence of peer-to-peer agent communication, dynamic agent discovery, or orchestrated multi-agent workflows. Operates in isolation.</td>
    </tr>
    <tr>
      <td>Non-Determinism</td>
      <td>0.5</td>
      <td>Uses a mix of structured exception reporting and natural language explanations. AI-generated explanations are semi-structured; no strict schema enforcement for all outputs.</td>
    </tr>
    <tr>
      <td>Opacity &amp; Reflexivity</td>
      <td>0.5</td>
      <td>Maintains an auditable log of all actions and decisions, but does not expose full step-by-step internal reasoning for every inference.</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 6: OWASP AIVSS capability breakdown</em>
</p>

## Contributors

[Michael Koegler, Market Alpha Advisors](https://www.linkedin.com/in/michaelkoegler/)