# Applying the Agent Metadata Specification to the Upstream Operations in the Oil & Gas Industry – AI-Driven Drilling Intelligence

## Introduction

The cross-industry Agent Metadata Specification is published [here](https://github.com/TavroOrg/Agent-Metadata-Specification/tree/main/assets/Publications). This section provides an example that combines all the relevant artifacts for upstream operations in the oil and gas industry.

## Conceptual Model

An overall conceptual model for the use case is shown in Figure 1.

<p align="center">
  <img src="../assets/images/Oil & Gas – AI-Driven Drilling Intelligence.png" alt="Oil & Gas – AI-Driven Drilling Intelligence" width="600" >
  <br>
  <em>Figure 1: Conceptual model for AI-driven drilling intelligence in the oil and gas industry</em>
</p>

This example covers the following artifacts (see Table 1):

<table align="center">
  <tr>
    <th>Artifacts</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>1. AI Use Case</td>
    <td>
      <ul>
        <li>Agentic Upstream Real-Time Operations &amp; Risk Advisor for AI-Driven Drilling Intelligence</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>2. Agent</td>
    <td>
      <ul>
        <li>Real-Time Drilling Surveillance Agent</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>3. Data Sources</td>
    <td>
      <ul>
        <li>OSDU Wellbore (Master Data)</li>
        <li>OSDU WellboreTrajectory (WPC)</li>
        <li>OSDU WellLog (WPC)</li>
        <li>OSDU MudLog (WPC)</li>
        <li>OSDU DrillReport (WPC)</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>4. Tools</td>
    <td>
      <ul>
        <li>OSDU Wellbore DDMS API</li>
        <li>OSDU Search &amp; Storage API</li>
        <li>Statistical Process Control Engine</li>
        <li>ML Anomaly Detection Model</li>
        <li>Well Health Score Calculator</li>
        <li>Alert Publishing Tool</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>5. Applications</td>
    <td>
      <ul>
        <li>OSDU Data Platform</li>
        <li>Drilling Operations Dashboard</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>6. Business Processes</td>
    <td>
      <ul>
        <li>Real-Time Drilling Monitoring</li>
        <li>Non-Productive Time (NPT) Management</li>
        <li>Equipment Failure Prevention</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>7. Regulations</td>
    <td>
      <ul>
        <li>EU AI Act Article 6 (Critical Infrastructure - High Risk)</li>
        <li>American Petroleum Institute RP 92U - Underbalanced Drilling Operations</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>8. Agent Risk Assessments</td>
    <td>
      <ul>
        <li>Business Continuity Assessment</li>
        <li>Legal Risk Assessment</li>
        <li>Regulatory Risk Assessment</li>
        <li>Cybersecurity Risk Assessment</li>
        <li>Statutory Reporting Risk Assessment</li>
        <li>Data Risk Assessment</li>
      </ul>
    </td>
  </tr>
</table>

<p align="center">
  <em>Table 1: Agent metadata artifacts for AI-driven drilling intelligence</em>
</p>

### 1. AI Use Case – Agentic Upstream Real-Time Operations & Risk Advisor

The Agentic Upstream Real-Time Operations & Risk Advisor for AI-Driven Drilling Intelligence AI use case uses three specialized agents. Upstream drilling operations generate over 10TB of data per well per day, yet this data remains locked in siloed systems preventing real-time cross-domain analysis. Drilling engineers rely on manual monitoring and reactive decision-making, resulting in high non-productive time, costly equipment failures, and sub-optimal drilling parameters that reduce Rate of Penetration (ROP).

The use case encompasses the following expected benefits:

- Reduced equipment failure incidents by 20 percent through predictive monitoring of downhole sensor streams
- Reduced Non-Productive Time (NPT) by 10 percent through real-time anomaly detection and early intervention
- Improved ROP by 15 percent through AI-driven parameter optimization recommendations
- Reduced drilling cost per well by 12 percent through combined NPT, failure, and efficiency improvements
- Reduced decision cycle time by 60 percent through automated data aggregation and engineer-ready decision packages
- Automated Daily Drilling Report (DDR) generation at 90 percent rate, freeing engineer time for analysis


### 2. Agent - Real-Time Drilling Surveillance Agent

The Real-Time Drilling Surveillance Agent is the frontline sensing and monitoring agent of the AI use case. It ingests continuous real-time Wellsite Information Transfer Standard Markup Language (WITSML) 2.1 data streams through the OSDU Wellbore Drilling Data Management Service DDMS, performs live anomaly detection on key drilling parameters, and maintains a real-time Well Health Score (0–100) for every active wellbore. It serves as the primary alerting agent and the data provider for additional downstream AI agents.

The agent follows a strict seven-step process:

- Step 1 - Continuously poll OSDU WITSML streams for all active wellbores at a configurable interval (default: 30 seconds)
- Step 2 - Apply Statistical Process Control (SPC) and ML-based anomaly detection to key parameters: ROP, Weight on Bi (WOB), torque, Revolutions Per Minute (RPM), standpipe pressure, Equivalent Circulating Density (ECD), and mud pit volume
- Step 3 - Compare live values against operational envelopes derived from OSDU WellLog data and offset well benchmarks
- Step 4 - Compute a real-time Well Health Score (0–100) per active wellbore and update every monitoring cycle
- Step 5 - When a threshold is breached, classify severity (Informational / Advisory / Critical) and publish a structured alert payload to the shared event bus
- Step 6 - Forward anomaly context (timestamp, parameter values, deviation magnitude, wellbore ID) to another AI agent for risk probability scoring
- Step 7 - Log all events to the OSDU DrillReport WPC for traceability and automated DDR generation

Key behavioral guardrail: the agent must never modify drilling system setpoints or parameters autonomously.

### 3. Data Source – OSDU Data Platform (Wellbore & Drilling Data)

The agent accesses multiple data domains relating to the [OSDU (Open Subsurface Data Universe) Platform](https://osduforum.org/osdu-data-platform-primer-1/) (see Table 2). OSDU is an open-source data platform standard developed by The Open Group for the oil and gas industry. It provides a common framework for managing subsurface data across the energy sector.

In OSDU's data model, there are three tiers: Master Data (e.g., Wellbore, Well), Work Product (WP), and Work Product Component (e.g., WellboreTrajectory). A WPC. A WPC is where the real technical data lives. It is always associated with a parent Work Product and references a Master Data entity.

<table align="center">
  <tr>
    <th>OSDU Data Domain</th>
    <th>Domain Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>Wellbore</td>
    <td>Master Data</td>
    <td>Active wellbore identity, depth, and operational status for all monitored wells</td>
  </tr>
  <tr>
    <td>WellboreTrajectory</td>
    <td>WPC</td>
    <td>Real-time and planned well path data in WITSML and CSV formats</td>
  </tr>
  <tr>
    <td>WellLog</td>
    <td>WPC</td>
    <td>Real-time sensor logs: ROP, WOB, torque, RPM, ECD, gamma ray sourced via WITSML 2.1</td>
  </tr>
  <tr>
    <td>MudLog</td>
    <td>WPC</td>
    <td>Mud weight, viscosity, pit levels, and gas readings for wellbore fluid monitoring</td>
  </tr>
  <tr>
    <td>DrillReport</td>
    <td>WPC</td>
    <td>Daily drilling reports and operational event logs; agent writes anomaly and alert events back for traceability</td>
  </tr>
</table>

<p align="center">
  <em>Table 2: OSDU-compliant data sources accessed by the real-time drilling surveillance agent</em>
</p>

### 4. Tools

The Real-Time Drilling Surveillance Agent may use the following tools (see Table 3):

<table align="center">
  <tr>
    <th>Tool</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>OSDU Wellbore DDMS API</td>
    <td>The primary real-time data ingestion tool. Connects to the OSDU Wellbore DDMS to ingest live WITSML 2.1 sensor streams from active wellbores. Provides sub-minute latency telemetry for ROP, WOB, torque, RPM, and standpipe pressure.</td>
  </tr>
  <tr>
    <td>OSDU Search &amp; Storage API</td>
    <td>Used to retrieve historical WellLog and DrillReport data from the OSDU Data Platform. This data is used to construct operational parameter baselines and offset well benchmarks against which live values are compared for anomaly detection.</td>
  </tr>
  <tr>
    <td>Statistical Process Control Engine</td>
    <td>Monitors real-time parameter distributions and flags statistical deviations using SPC methods (control charts, 3-sigma thresholds). Provides the first layer of anomaly detection before ML models are applied.</td>
  </tr>
  <tr>
    <td>ML Anomaly Detection Model</td>
    <td>Applies Isolation Forest and LSTM (Long Short-Term Memory) neural network models to detect complex, multivariate drilling parameter anomalies that SPC alone cannot capture. Trained on historical OSDU WellLog and DrillReport data.</td>
  </tr>
  <tr>
    <td>Well Health Score Calculator</td>
    <td>Aggregates sensor readings, SPC flags, and ML anomaly signals into a single composite Well Health Score (0-100) per active wellbore. Score is updated every monitoring cycle and serves as the primary KPI on the operations dashboard.</td>
  </tr>
  <tr>
    <td>Alert Publishing Tool</td>
    <td>Publishes structured alert payloads - classified by severity (Informational / Advisory / Critical) - to the internal event bus for routing to downstream notification services.</td>
  </tr>
</table>

<p align="center">
  <em>Table 3: Tools used by the real-time drilling surveillance agent</em>
</p>

### 5. Applications - OSDU Data Platform / Drilling Operations Dashboard

The Real-Time Drilling Surveillance Agent reads real-time drilling telemetry and historical subsurface data from the OSDU Data Platform via its Wellbore DDMS and Search/Storage APIs. Anomaly alerts and Well Health Scores are published to the Drilling Operations Dashboard for engineer review. All event logs and alert outputs are written back to the OSDU DrillReport WPC for audit traceability and downstream reporting by the agent.

### 6. Business Processes - Real-Time Drilling Monitoring / NPT Management / Equipment Failure Prevention

The Real-Time Drilling Surveillance Agent is used within the following upstream operational processes:

- Real-Time Drilling Monitoring - Continuous 24/7 surveillance of all active wellbore parameters across the well program portfolio
- NPT - Early detection of developing issues (wellbore instability, stuck pipe, kicks) to enable intervention before NPT events occur
- Equipment Failure Prevention - Predictive identification of equipment degradation signatures (bit wear, Bottom Hole Assembly - BHA fatigue, pump performance) to schedule maintenance proactively

### 7. Regulations – EU AI Act / API RP 92U

The following regulations may govern this agent (see Table 4).

<table align="center">
  <tr>
    <th>Regulation</th>
    <th>Requirement</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>EU AI Act Article 6</td>
    <td>High-Risk AI Systems (Critical Infrastructure)</td>
    <td>The agent is deployed as a safety and monitoring component within upstream oil and gas critical infrastructure. This triggers a mandatory High Risk classification under Article 6.</td>
  </tr>
  <tr>
    <td>American Petroleum Institute RP 92U</td>
    <td>Underbalanced Drilling Operations</td>
    <td>Provides information that can serve as a guide for planning, installation, operation, and testing of underbalanced drilling equipment systems on land and offshore drilling rigs.</td>
  </tr>
</table>

<p align="center">
  <em>Table 4: Regulations governing the AI use case and agent</em>
</p>

### 8. Agent Risk Assessment

[ORX](https://orx.org/) provides an overall framework for operational risk. The Agent Risk Assessment maps into six operational risk events within the ORX taxonomy (see Figure 2).

<p align="center">
  <img src="../assets/images/AI-Driven Drilling Surveillance Agent Operational Risk.png" alt="AI-Driven Drilling Surveillance Agent Operational Risk" width="600" >
  <br>
  <em>Figure 2: Mapping of agent risk assessment into ORX operational risk taxonomy</em>
</p>

#### 8.1 Business Continuity Assessment

If the Real-Time Drilling Surveillance Agent fails, the most immediate consequence is the loss of continuous 24/7 surveillance across active wellbores, forcing drilling engineers to revert to manual monitoring - precisely the reactive, error-prone approach the system was designed to replace. Without the agent's real-time anomaly detection, early warning signals for high-consequence events such as wellbore instability, stuck pipe, and kicks would go undetected, dramatically increasing the probability of Non-Productive Time (NPT) events that the system was projected to reduce by 10%. The failure would also eliminate the Well Health Score (0–100) as a real-time KPI on the Drilling Operations Dashboard, removing the primary decision-support tool available to engineers managing multiple simultaneous wellbores across a well program portfolio.

#### 8.2 Legal Risk Assessment

Data access is governed by the OSDU Entitlements API and partition-level access controls. This area is considered high risk for the reasons shown in Table 5.

<table align="center">
  <tr>
    <th>Data Type</th>
    <th>Sensitivity</th>
  </tr>
  <tr>
    <td>Well Logs and Trajectories</td>
    <td>Reveals reservoir quality (competitive intelligence)</td>
  </tr>
  <tr>
    <td>Seismic Data</td>
    <td>Multi-million dollar acquisition cost (IP protection)</td>
  </tr>
  <tr>
    <td>Pore Pressure Data</td>
    <td>Drilling safety</td>
  </tr>
  <tr>
    <td>Production Rates</td>
    <td>Commercially sensitive (impacts stock price)</td>
  </tr>
  <tr>
    <td>Real-time Drilling Data</td>
    <td>Operational security (rig safety)</td>
  </tr>
  <tr>
    <td>Formation Tops</td>
    <td>Exploration competitive advantage</td>
  </tr>
</table>

<p align="center">
  <em>Table 5: Drilling data and sensitivity</em>
</p>

Without robust access control, the wrong person seeing the wrong data can mean violations of export control, data sovereignty laws, and joint venture data sharing violations.

#### 8.3 Regulatory Risk Assessment

The Real-Time Drilling Surveillance agent is flagged under Critical Infrastructure (upstream oil and gas drilling operations), which triggers a High Risk regulatory classification under Article 6 of the EU AI Act. This is consistent with the EU AI Act's treatment of AI systems used as safety or monitoring components within critical energy infrastructure sectors. Importantly, the agent does not process Personally Identifiable Information (PII), Protected Health Information (PHI), or Payment Card Industry (PCI) data. All data processed relates exclusively to wellbore operational parameters, formation properties, and equipment telemetry. No Article 5 prohibited practices are present.

#### 8.4 Cybersecurity Risk Assessment

The OWASP AI Vulnerability Scoring System (AIVSS) Capability Breakdown is 4.0/10 as shown in Table 6.

<table align="center">
  <tr>
    <th>Capability</th>
    <th>Score</th>
    <th>Summary</th>
  </tr>
  <tr>
    <td>Autonomy of Action</td>
    <td>0.5</td>
    <td>Operates on a fixed polling interval with predefined models and thresholds. Action space is restricted to defined monitoring and alerting functions. No unbounded code execution.</td>
  </tr>
  <tr>
    <td>Goal-Driven Planning</td>
    <td>0.5</td>
    <td>Executes a multi-step monitoring and alerting process, but all steps are predefined. No recursive planning or sub-agent delegation.</td>
  </tr>
  <tr>
    <td>Self-Modification</td>
    <td>0.0</td>
    <td>No ability to modify its own code, instructions, or persistent logic. All model updates are performed externally on a quarterly schedule.</td>
  </tr>
  <tr>
    <td>Dynamic Tool Use</td>
    <td>0.5</td>
    <td>Uses APIs restricted to the OSDU environment. No arbitrary write/execute or open-ended tool invocation beyond the defined toolset.</td>
  </tr>
  <tr>
    <td>Memory Use</td>
    <td>0.5</td>
    <td>Logs events to the OSDU DrillReport WPC and uses historical data for baselines. No persistent cross-session learning or writable memory outside OSDU.</td>
  </tr>
  <tr>
    <td>Contextual Awareness</td>
    <td>0.5</td>
    <td>Accesses real-time and historical data from OSDU APIs. Curated, semi-open contextual awareness. No unrestricted internet or external event stream access.</td>
  </tr>
  <tr>
    <td>Dynamic Identity</td>
    <td>0.0</td>
    <td>Static identity and permissions. No role switching or permission escalation.</td>
  </tr>
  <tr>
    <td>Multi-Agent Interactions</td>
    <td>0.5</td>
    <td>Forwards anomaly context to surveillance agent and publishes alerts to a shared event bus. Orchestrated/static interactions with predefined agents only. No dynamic peer discovery.</td>
  </tr>
  <tr>
    <td>Non-Determinism</td>
    <td>0.5</td>
    <td>ML models introduce bounded non-determinism, but outputs are structured (alerts, scores) and follow predefined schemas.</td>
  </tr>
  <tr>
    <td>Opacity &amp; Reflexivity</td>
    <td>0.5</td>
    <td>Logs all events to the OSDU DrillReport WPC and publishes structured alerts. No explicit step-by-step reasoning log or full traceability dashboard documented.</td>
  </tr>
</table>

<p align="center">
  <em>Table 6: OWASP AIVSS capability breakdown</em>
</p>

#### 8.5 Statutory Reporting Risk Assessment

Norway's petroleum fiscal regime, administered through the Norwegian Tax Administration and the Norwegian Ocean Industry Authority, relies heavily on operator-reported production forecasts for offshore petroleum income under the Petroleum Taxation Act. This means that materially inaccurate forecasts - whether understated or overstated - could constitute a violation of operators' statutory disclosure obligations and expose the company to back-taxes, interest penalties, and potential criminal liability under Norwegian petroleum law. Given that real-time drilling data feeds directly into reserve and production estimates, an AI agent producing flawed or unauditable output could undermine the integrity of mandatory reporting to the Norwegian Offshore Directorate, which uses production data not only for tax purposes but for national resource management and sovereignty over the continental shelf.

#### 8.6 Data Risk Assessment

The agent does not access Personally Identifiable Information (PII), Protected Health Information (PHI), or Payment Card Industry (PCI) data. All data sources are restricted to operational drilling telemetry and subsurface formation data within the OSDU Data Platform.

## Contributors

[Kjetil Eritzland, Capgemini Norway](https://www.linkedin.com/in/kjetil-eritzland-b656041/)
