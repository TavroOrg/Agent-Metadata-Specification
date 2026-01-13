# Agent Metadata Specification

## Introduction

AI agents are multiplying across the enterprise. Similar to the challenges with shadow IT, AI agents are creating so called shadow action. AI agents are often unmanaged, unmapped and autonomous. The result is a critical visibility vacuum (see Figure 1).

<p align="center">
  <img src="./assets/images/Silent%20Proliferation.png" alt="Silent Proliferation" width="600">
  <br>
  <em>Figure 1: AI agents create a visibility vacuum</em>
</p>


## Agent Proliferation and Challenges

Because agents are easy to build and deploy, they create multiple challenges (see **Figure 2**):

- *Discovery Gap* – Organizations do not know that the agents exist, who owns them, or where they operate.
- *Risk Multiplier* – Agents may operate as unmonitored “digital insiders” with high privileges and broad access.
- *Cost Bloat* – Redundant agents waste compute cycles and inflate cloud bills.

<p align="center">
  <img src="./assets/images/The%20Visibility%20Vaccum.png" alt="The Visibility Vaccum" width="600">
  <br>
  <em>Figure 2: AI agents create a discovery gap, risk multiplier, and cost bloat</em>
</p>

This document serves as a comprehensive template for capturing the essential metadata and core configuration parameters of a specific AI agent. The strategic importance of this template lies in its role as a standardized framework for organizations leveraging enterprise-grade agentic solutions.

## Importance of Agent Metadata Standards

By implementing this robust metadata specification, enterprises gain several critical, strategic advantages:

- **Unified Enterprise-Wide View and Single Source of Truth of Agents:** The specification provides a mechanism to develop a consolidated, holistic view of all deployed agents across the entire organization. This centralization establishes a single, authoritative source of information for every agent, eliminating data silos and inconsistencies that can plague decentralized management systems.

- **Enhanced Accountability and Transparency of Ownership:** The metadata structure rigorously captures ownership details, ensuring clear accountability for the agent's performance, maintenance, and policy adherence. This transparency is crucial for operational governance and risk mitigation.

- **Automated Risk Management Functions for Agents:** By leveraging the standardized metadata, enterprises can apply systematic risk analysis, monitoring, and control across all business processes, applications, and the underlying agents they consume.

- **Accelerated Audit Readiness for Governance and Compliance:** The standardized and comprehensive nature of the metadata significantly accelerates the process of achieving audit readiness. It provides a structured record necessary for satisfying stringent governance requirements and demonstrating compliance with internal policies and external regulations (e.g., GDPR, CCPA, industry-specific compliance standards).

- **Easier Third-Party Risk Assessments for AI-Enabled Applications:** By standardizing the agent metadata, applications with embedded agents should find it easier to complete third-party risk assessments.

## Agent Proliferation

Traditional metadata platforms capture information primarily from analytical systems. However, the metadata challenges increase exponentially for agents, which also leverage operational systems (see **Figure 3**).

<p align="center">
  <img src="./assets/images/A%20Critical%20Shift%20in%20Risk.png" alt="A Critical Shift in Risk" width="600">
  <br>
  <em>Figure 3: Agent metadata increases exponentially from analytical to operational systems</em>
</p>

A number of platforms either produce or consume agent metadata (see **Figure 4**).

<p align="center">
  <img src="./assets/images/Enterprises%20must%20get%20ready%20to%20govern%20exponential%20agentic%20sprawl.png" alt="Enterprises must get ready to govern exponential agentic sprawl" width="600">
  <br>
  <em>Figure 4: Producers and consumers of agent metadata</em>
</p>

### Agent Metadata Producers including the following:

- Hyperscalers (e.g., Microsoft Copilot, Google Vertex AI, IBM watsonx, Amazon Bedrock)
- LLM Providers (e.g., OpenAI, Anthropic, Perplexity)
- Data Cloud Providers (e.g., Snowflake, Databricks)
- Pure Play Agent Platforms (e.g., crewAI, LangGraph)
- Data Science Vendors (e.g., Dataiku, DataRobot, SAS)
- Enterprise Applications with out-of-the-box (OOTB) and roll-your-own (RYO) agents
  (e.g., ServiceNow NowAssist, SAP Joule, Workday Illuminate, Salesforce Agentforce)
- Industry-Specific Applications with OOTB and RYO agents  
  (e.g., Fiserv and NICE Actimize in Banking, Epic and Oracle in healthcare, Guidewire in Insurance)
- The typical enterprise uses more than 1,000 applications and an increasing percentage of these platforms will have OOTB and RYO agents

### Agent Metadata Consumers including the following:

- Hyperscalers (e.g., Microsoft Agent 365, IBM watsonx)
- Data Catalogs (e.g., Alation, Atlan, Collibra, data.world/ServiceNow, Informatica/Salesforce)
- Enterprise Applications (e.g., ServiceNow AI Control Tower, Workday Illuminate)
- Governance, Risk, and Compliance (GRC) Platforms (e.g., Archer, Hyperproof, MetricStream, ServiceNow IRM)

## Agent Data Model

The template is logically partitioned into the following key sections, each addressing a distinct facet of the Agent's identity, operation, and lifecycle:

- **Agent Identification:** This foundational section is dedicated to capturing the metadata required to uniquely identify the Agent. This includes key identifiers, its current deployment status (e.g., development, staging, production, deprecated), versioning information, and the essential details regarding its ownership and organizational context.

- **Configuration:** This section details the technical architecture and underlying components of the Agent. It meticulously categorizes and documents metadata associated with the core technologies, such as the underlying Large Language Model (LLM) being utilized (e.g., model name, version, fine-tuning details), specific Memory models (e.g., type, retention policy, capacity), and other critical computational and operational parameters.

- **Knowledge:** This section provides a deep dive into the information resources the Agent relies upon. It specifies the data sources it has been trained on (e.g., dataset identifiers, date of last training), and critically, details the mechanisms and interfaces it uses to access its knowledge base, including Retrieval-Augmented Generation (RAG) system configurations, database connections, and document repositories.

- **Tools and Actions:** This defines the Agent's functional capabilities and its interaction boundary with the external world. It enumerates what the Agent is capable of doing (its designated actions and use cases) and precisely how it interacts with external systems, APIs, or business applications, including function call specifications and security protocols.

- **Lineage:** This is a vital section for enterprise governance, establishing the end-to-end context for the Agent's usage. It meticulously maps the Agent to the specific business processes and high-level enterprise applications that consume or are associated with it. This mapping provides a comprehensive view of the Agent's usage patterns, the data sets it consumes (input lineage), and the resulting data sets it produces (output lineage), which is essential for impact analysis.

- **Risks and Controls:** This critical section consolidates a comprehensive view of all identified risks associated with the agent.

## Identification
Table 1 summarizes the core identifying and descriptive details of the agent.

<table>
  <thead>
    <tr>
      <th><b>Attribute</b></th>
      <th><b>Description</b></th>
    </tr>
  </thead>
  <tbody>
    <tr><td>Agent ID</td><td>A unique, permanent identifier for the agent (e.g., HR-POL-003)</td></tr>
    <tr><td>Agent Version</td><td>The current version number of the agent's configuration and logic</td></tr>
    <tr><td>Title</td><td>The human-readable name of the agent (e.g., Internal HR Policy Assistant)</td></tr>
    <tr><td>Description</td><td>A concise summary of the agent's purpose, capabilities, and target user</td></tr>
    <tr><td>Goal Orientation</td><td>The specific objective or success metric the agent is designed to achieve</td></tr>
    <tr><td>Role</td><td>The defined character or communication style that governs its interaction</td></tr>
    <tr><td>Owner</td><td>The team or department responsible for the agent's maintenance and cost</td></tr>
    <tr><td>Environment</td><td>The deployment environment (e.g., DEV, UAT, PROD)</td></tr>
    <tr><td>Tags</td><td>A list of keywords for search and categorization (e.g., HR, policy, internal)</td></tr>
    <tr><td>Governance Status</td><td>The current governance lifecycle status (e.g., DRAFT, APPROVED, DECOMMISSIONED)</td></tr>
    <tr><td>Reviewer</td><td>Name of the person who approved the latest governance status</td></tr>
  </tbody>
</table>
<p align="center"><i>Table 1: Agent identification details</i></p>

## Configuration
Table 2 summarizes the configuration details for the agent.

<table>
    <thead>
        <tr>
        <th><b>Attribute</b></th>
        <th><b>Description</b></th>
        </tr>
  </thead>
  <body>
    <tr><td>LLM Model</td><td>The specific foundational model used by the agent (e.g., gemini-2.5-flash)</td></tr>
    <tr><td>Prompt Template Reference</td><td>The ID of the template used for guiding LLM behavior (e.g., ABC-RAG-Standard-V2)</td></tr>
    <tr><td>Access Scope</td><td>The agent's overall data access level (e.g., LOW_PRIVILEGE)</td></tr>
    <tr><td>Memory Storage Reference</td><td>The external system used for long-term data/vector storage (e.g., Atlas-HR-RAG-VectorDB)</td></tr>
    <tr><td>Memory Type</td><td>The type of memory storage used (e.g., VECTOR_DB, KEY_VALUE_STORE)</td></tr>
    <tr><td>Data Freshness Policy</td><td>The maximum acceptable age of the data (caching policy) for the source</td></tr>
    <tr><td>Autonomy Level</td><td>The degree to which the agent can act independently without human approval (FULL, SEMI-AUTONOMOUS, REACTIVE)</td></tr>
    <tr><td>Reasoning Model</td><td>The underlying logic or planning paradigm (ReAct, ReWOO, Deductive, Inductive, Goal-based)</td></tr>
    <tr><td>Multimodal Capability</td><td>The types of input the agent can process</td></tr>
  </body>
</table>
<p align="center"><i>Table 1: Agent configuration details</i></p>

## Knowledge Sources
Table 3 summarizes the knowledge sources for the agent.

<table>
  <thead>
    <tr>
      <th><b>Attribute</b></th>
      <th><b>Description</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Identifier</td>
      <td>A Unique ID for the knowledge source</td>
    </tr>
    <tr>
      <td>Name</td>
      <td>A list of all specific data sources (e.g., databases, documents) the agent can access</td>
    </tr>
    <tr>
      <td>Access Mechanism</td>
      <td>The protocol or service used to retrieve knowledge (e.g., REST API, SQL connector)</td>
    </tr>
  </tbody>
</table>
<p align="center"><i>Table 3: Agent knowledge details</i></p>

## Tools and Actions
Table 4 summarizes the tools configured for the agent including its external capabilities and delegation options.

<table>
  <thead>
    <tr>
      <th><b>Attribute</b></th>
      <th><b>Description</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Identifier</td>
      <td>A unique reference ID for the tool (e.g., PolicySearchTool)</td>
    </tr>
    <tr>
      <td>Name</td>
      <td>Name of the tool</td>
    </tr>
    <tr>
      <td>Description</td>
      <td>Detailed explanation of the purpose and functionality</td>
    </tr>
    <tr>
      <td>Delegation Possible</td>
      <td>Boolean indicating if the agent can pass the request to another agent</td>
    </tr>
    <tr>
      <td>Allowed Delegates</td>
      <td>A list of Agent IDs, which the agent is allowed to delegate to</td>
    </tr>
    <tr>
      <td>Input or Output</td>
      <td>Indicates whether it is an input or output parameter</td>
    </tr>
    <tr>
      <td>Parameter Name</td>
      <td>Name of the parameter</td>
    </tr>
    <tr>
      <td>Parameter Type</td>
      <td>Required type and format of the parameter</td>
    </tr>
    <tr>
      <td>Default Value</td>
      <td>Default value, if any</td>
    </tr>
  </tbody>
</table>
<p align="center"><i>Table 4: Agent tool and action details</i></p>

## Business Process
Table 5 summarizes business processes that consume the agent.

<table>
  <thead>
    <tr>
      <th><b>Attribute</b></th>
      <th><b>Description</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Identifier</td>
      <td>The ID of the business process that uses the agent</td>
    </tr>
    <tr>
      <td>Name</td>
      <td>The human-readable name of the business process</td>
    </tr>
    <tr>
      <td>Description</td>
      <td>A brief description of the business process, its significance and relevance</td>
    </tr>
    <tr>
      <td>Consumption Type</td>
      <td>PRIMARY (core to process) or SECONDARY (auxiliary role)</td>
    </tr>
  </tbody>
</table>
<p align="center"><i>Table 5: Business process details</i></p>

## Application
Table 6 summarizes applications that consume the agent.

<table>
  <thead>
    <tr>
      <th><b>Attribute</b></th>
      <th><b>Description</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Identifier</td>
      <td>The ID of the business application that uses the agent. Ideally this should be a reference to an application configuration management database (CMDB)</td>
    </tr>
    <tr>
      <td>Name</td>
      <td>The human-readable name of the application</td>
    </tr>
    <tr>
      <td>Description</td>
      <td>A brief description of the application including its significance and relevance</td>
    </tr>
    <tr>
      <td>Consumption Type</td>
      <td>PRIMARY (core to application) or SECONDARY (auxiliary role)</td>
    </tr>
  </tbody>
</table>
<p align="center"><i>Table 6: Application details</i></p>

## Data Lineage
Agentic lineage needs to map the entire decision path from prompt to logic to action to impact (see Figure 5).

<p align="center">
  <img src="./assets/images/The%20Governance%20Gap.png" alt="The Governance Gap" width="600">
  <br>
  <em>Figure 5: Agentic lineage</em>
</p>

Table 7 captures the data sets associated with the agent.

<table>
  <thead>
    <tr>
      <th><b>Attribute</b></th>
      <th><b>Description</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Relationship ID</td>
      <td>A unique Relationship ID</td>
    </tr>
    <tr>
      <td>Parent Relationship ID</td>
      <td>Parent ID, if any</td>
    </tr>
    <tr>
      <td>Source Object ID</td>
      <td>Unique ID as in the Source system</td>
    </tr>
    <tr>
      <td>Source Object Domain</td>
      <td>Domain</td>
    </tr>
    <tr>
      <td>Source Object Name</td>
      <td>Object name</td>
    </tr>
    <tr>
      <td>Source Object Type</td>
      <td>Type of Source Object (e.g., Agent, MCP Server, Table, Column, View, File, Folder)</td>
    </tr>
    <tr>
      <td>Target Object ID</td>
      <td>Unique ID as in the Target system</td>
    </tr>
    <tr>
      <td>Target Object Domain</td>
      <td>Domain</td>
    </tr>
    <tr>
      <td>Target Object Name</td>
      <td>Object Name</td>
    </tr>
    <tr>
      <td>Target Object Type</td>
      <td>Type of Target Object (e.g., Agent, MCP Server, Table, Column, View, File, Folder)</td>
    </tr>
    <tr>
      <td>Access Level</td>
      <td>READ, WRITE or DELETE</td>
    </tr>
  </tbody>
</table>
<p align="center"><i>Table 7: Agent data lineage</i></p>

## Risks
Table 8 consolidates all risks associated with the agents across all risk vectors (e.g., data, security, Responsible AI, etc.)

<table>
  <thead>
    <tr>
      <th><b>Attribute</b></th>
      <th><b>Description</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Identifier</td>
      <td>A unique Risk ID</td>
    </tr>
    <tr>
      <td>Name</td>
      <td>Name of the Risk</td>
    </tr>
    <tr>
      <td>Description</td>
      <td>Description of the Risk</td>
    </tr>
    <tr>
      <td>Type</td>
      <td>Type of Risk (e.g., Compliance, Reputational, Cyber, Responsible AI, Third-Party)</td>
    </tr>
    <tr>
      <td>Impact</td>
      <td>The expected impact of the risk (LOW, MEDIUM, HIGH)</td>
    </tr>
    <tr>
      <td>Likelihood</td>
      <td>The expected likelihood of the risk materializing (LOW, MEDIUM, HIGH)</td>
    </tr>
  </tbody>
</table>
<p align="center"><i>Table 8: Agent risks</i></p>

## Controls
Table 9 consolidates all risks associated with the agents across all risk vectors (e.g., data, security, Responsible AI, etc.)

<table>
  <thead>
    <tr>
      <th><b>Attribute</b></th>
      <th><b>Description</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Identifier</td>
      <td>A unique ID for the control (e.g., C-DAT-005)</td>
    </tr>
    <tr>
      <td>Name</td>
      <td>The human-readable name of the control</td>
    </tr>
    <tr>
      <td>Description</td>
      <td>A detailed description of the control's function</td>
    </tr>
    <tr>
      <td>Risk Identifier</td>
      <td>A list of risk vectors, which the control is designed to mitigate</td>
    </tr>
  </tbody>
</table>
<p align="center"><i>Table 9: Agent controls</i></p>
