# Agent Metadata Specification

## Introduction

AI agents are multiplying across the enterprise. Similar to the challenges with shadow IT, AI agents are creating so called shadow action. AI agents are often unmanaged, unmapped and autonomous. The result is a critical visibility vacuum.

<p align="center">
  <img src="./assets/images/Silent%20Proliferation.png" alt="Silent Proliferation" width="600">
  <br>
</p>


## Agent Proliferation and Challenges

Because agents are easy to build and deploy, they create multiple challenges:

- *Discovery Gap* – Organizations do not know that the agents exist, who owns them, or where they operate.
- *Risk Multiplier* – Agents may operate as unmonitored “digital insiders” with high privileges and broad access.
- *Cost Bloat* – Redundant agents waste compute cycles and inflate cloud bills.

<p align="center">
  <img src="./assets/images/The%20Visibility%20Vaccum.png" alt="The Visibility Vaccum" width="600">
  <br>
</p>

This document serves as a comprehensive template for capturing the essential metadata and core configuration parameters of a specific AI agent. The strategic importance of this template lies in its role as a standardized framework for organizations leveraging enterprise-grade agentic solutions.

## Enhancing Google Agent2Agent (A2A) Protocol

The Google [Agent2Agent (A2A)](https://developers.googleblog.com/en/a2a-a-new-era-of-agent-interoperability/) is an open protocol that provides a standard way for agents to collaborate with each other, regardless of the underlying framework or vendor. Agents can advertise their capabilities using an "Agent Card" in JSON format, allowing the client agent to identify the best agent that can perform a task and leverage A2A to communicate with the remote agent.

The Agent Card lays the operational foundation for agents to find each other, understand basic capabilities (modalities), and handshake for collaboration. However, the Agent Card does not address the business context, risk management, and governance.

The Agent Metadata Specification seeks to enhance the Google Agent Card to address these additional topics.

## Importance of Agent Metadata Standards

By implementing this robust metadata specification, enterprises gain several critical, strategic advantages:

- **Unified Enterprise-Wide View and Single Source of Truth of Agents:** The specification provides a mechanism to develop a consolidated, holistic view of all deployed agents across the entire organization. This centralization establishes a single, authoritative source of information for every agent, eliminating data silos and inconsistencies that can plague decentralized management systems.

- **Enhanced Accountability and Transparency of Ownership:** The metadata structure rigorously captures ownership details, ensuring clear accountability for the agent's performance, maintenance, and policy adherence. This transparency is crucial for operational governance and risk mitigation.

- **Automated Risk Management Functions for Agents:** By leveraging the standardized metadata, enterprises can apply systematic risk analysis, monitoring, and control across all business processes, applications, and the underlying agents they consume.

- **Accelerated Audit Readiness for Governance and Compliance:** The standardized and comprehensive nature of the metadata significantly accelerates the process of achieving audit readiness. It provides a structured record necessary for satisfying stringent governance requirements and demonstrating compliance with internal policies and external regulations (e.g., GDPR, CCPA, industry-specific compliance standards).

- **Easier Third-Party Risk Assessments for AI-Enabled Applications:** By standardizing the agent metadata, applications with embedded agents should find it easier to complete third-party risk assessments.

## Agent Proliferation

Traditional metadata platforms capture information primarily from analytical systems. However, the metadata challenges increase exponentially for agents, which also leverage operational systems.

<p align="center">
  <img src="./assets/images/A%20Critical%20Shift%20in%20Risk.png" alt="A Critical Shift in Risk" width="600">
  <br>
</p>

A number of platforms either produce or consume agent metadata.

<p align="center">
  <img src="./assets/images/Enterprises%20must%20get%20ready%20to%20govern%20exponential%20agentic%20sprawl.png" alt="Enterprises must get ready to govern exponential agentic sprawl" width="600">
  <br>
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

