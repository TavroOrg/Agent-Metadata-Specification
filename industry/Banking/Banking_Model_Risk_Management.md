# Agent Metadata for Model Risk Management in Banking

## Introduction

The cross-industry Agent Metadata Specification is published [here](https://github.com/TavroOrg/Agent-Metadata-Specification/tree/main/assets/Publications). While the focus of the Agent Metadata Specification is on agent metadata, this section provides additional attributes that apply to Model Metadata. This section should also apply to use cases outside banking and financial services.

## Conceptual Model Updates
Banks use models for multiple use cases including credit risk, liquidity risk, and operational risk. These models may be Excel files, AI/ML models, or third-party models. These models may increasingly use agents. Figure 1 shows an overall conceptual model for model risk management in banking.

<p align="center">
  <img src="../assets/images/Banking Model Risk Management.png" alt="Banking Model Risk Management" width="600">
  <br>
  <em>Figure 1: Conceptual model for model risk management in banking</em>
</p>

## AI Model Attributes – Identification and Accountability Domain
Table 1 summarizes the attributes of an AI model that relate to Identification and Accountability. These drive ownership and inventory control.

<table align="center">
  <thead>
    <tr>
      <th><b>Attribute</b></th>
      <th><b>Description</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Model ID</td>
      <td>Unique identifier for the model</td>
    </tr>
    <tr>
      <td>Name</td>
      <td>Name of the model that uses or is used by the agent</td>
    </tr>
    <tr>
      <td>Description</td>
      <td>Description of the model</td>
    </tr>
    <tr>
      <td>Owner</td>
      <td>Name of the owner of the model</td>
    </tr>
    <tr>
      <td>Department Executive</td>
      <td>Name of the department executive of the model</td>
    </tr>
    <tr>
      <td>Using Departments</td>
      <td>Names of the departments that will be using the model</td>
    </tr>
    <tr>
      <td>Vendor vs. In-house</td>
      <td>Whether the model is offered by a vendor or built in-house</td>
    </tr>
    <tr>
      <td>Provider (If Vendor)</td>
      <td>Name of the model provider (if vendor)</td>
    </tr>
    <tr>
      <td>Lifecycle Status</td>
      <td>Current lifecycle of the model (e.g., Ideation, Development, Production, Retired)</td>
    </tr>
    <tr>
      <td>Version</td>
      <td>Version number of the model</td>
    </tr>
  </tbody>
</table>

<p align="center">
  <em>Table 1: AI model attributes for the identification and accountability domain</em>
</p>

## AI Model Attributes – Intended Use and Decision Impact Domain

Table 2 summarizes the attributes of an AI model that relate to Intended Use and Decision Impact. These establish regulatory boundaries.

<table align="center">
  <thead>
    <tr>
      <th><b>Attribute</b></th>
      <th><b>Description</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Business Use Case</td>
      <td>Use case and business value drivers for the model</td>
    </tr>
    <tr>
      <td>Users</td>
      <td>Types of users for the model</td>
    </tr>
    <tr>
      <td>Decision Type</td>
      <td>Type of decision that the model supports (e.g., credit, fraud, liquidity, etc.)</td>
    </tr>
    <tr>
      <td>Decision Automation Level</td>
      <td>Level of automation of the decisions being driven by the model (e.g., advisory, human-in-the-loop, automated)</td>
    </tr>
    <tr>
      <td>Regulatory Impact Flags</td>
      <td>Mapping to regulatory (e.g., Fair Lending, HMDA, CECL, etc.)</td>
    </tr>
    <tr>
      <td>Consumer Impact Indicator</td>
      <td>Impact on consumer</td>
    </tr>
    <tr>
      <td>Risk Tier / Materiality Classification</td>
      <td>Risk Tier / Materiality Classification</td>
    </tr>
  </tbody>
</table>

<p align="center">
  <em>Table 2: AI model attributes for the intended use and decision impact domain</em>
</p>

## AI Model Attributes – Model Construct
Table 3 summarizes the attributes of an AI model that relate to the model construct itself. These define what the model is.

<table align="center">
  <thead>
    <tr>
      <th><b>Attribute</b></th>
      <th><b>Description</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Model Type</td>
      <td>Type of model (e.g., statistical, machine learning, rules, agentic decision system)</td>
    </tr>
    <tr>
      <td>Algorithm Family</td>
      <td>The general class of mathematical or statistical techniques used by the model to learn patterns from data (e.g., Neural Networks, Decision Trees, Support Vector Machines)</td>
    </tr>
    <tr>
      <td>Training Methodology</td>
      <td>The learning approach used to train the model based on how labeled or unlabeled data is used (e.g., Supervised Learning, Unsupervised Learning, Reinforcement Learning)</td>
    </tr>
    <tr>
      <td>Retraining Frequency</td>
      <td>How often the model is updated or retrained with new data to maintain accuracy and relevance (e.g., Real-time/continuous retraining, Weekly retraining, Annual retraining)</td>
    </tr>
    <tr>
      <td>Feature Count</td>
      <td>The number of input variables or attributes used by the model to generate predictions (age, income)</td>
    </tr>
    <tr>
      <td>Processing</td>
      <td>How is data joined (e.g., API, transfer methods)</td>
    </tr>
    <tr>
      <td>Assumptions</td>
      <td>Reference to the underlying conditions or statistical premises the model relies on for valid predictions, typically documented in model documentation or research references (e.g., Linear relationship between variables, Independent observations, Normally distributed errors)</td>
    </tr>
    <tr>
      <td>Known Limitations</td>
      <td>Reference to documented constraints or weaknesses of the model that may affect reliability, fairness, or generalizability (e.g., Poor performance on out-of-distribution data, Sensitivity to noisy inputs, Bias due to training data imbalance)</td>
    </tr>
    <tr>
      <td>Stability Window / Applicability Scope</td>
      <td>The period or operational context in which the model is expected to produce reliable results (e.g., valid for current market conditions within the last 12 months, applicable only to U.S. retail customers, designed for transactions under $10,000)</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 3: AI model attributes for the model construct domain</em>
</p>

## AI Model Controls
Table 4 summarizes controls that govern an AI model.

<table align="center">
  <thead>
    <tr>
      <th><b>Control Type</b></th>
      <th><b>Control Description</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Access Governance</td>
      <td>
        <ul>
          <li>Access Provisioning Controls including documentary access that access to the model is limited to appropriate users and provisioned through an approval process</li>
          <li>Role-Based Access Controls</li>
          <li>Change Approval Workflows</li>
          <li>Deployment Environment (Dev/Test/Prod)</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Regulatory Guidance &amp; Compliance</td>
      <td>
        <ul>
          <li>Intellectual Property Considerations including documentary evidence that IP considerations dealing with training data and retrieving content were addressed</li>
          <li>Data Sovereignty Considerations including documentary evidence that data residency and cross-border transfer considerations were addressed</li>
          <li>Training Requirements for Users (e.g., Have users completed required American Bankers Association training on use of AI in models?)</li>
          <li>Third-Party Risk Assessments</li>
          <li>Regulatory Classification (e.g., SR 11-7 applicability)</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 4: AI model controls</em>
</p>

## AI Model Oversight and Evidence

Table 5 summarizes the attributes relating to the oversight and evidence of AI models.

<table align="center">
  <thead>
    <tr>
      <th><b>Object</b></th>
      <th><b>Attribute</b></th>
      <th><b>Description</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Documentation</td>
      <td>Documentation</td>
      <td>References to model documentation</td>
    </tr>
    <tr>
      <td>Model Validation</td>
      <td>Date</td>
      <td>Date of last model validation</td>
    </tr>
    <tr>
      <td>Model Validation</td>
      <td>Bias and Fairness</td>
      <td>Documentary evidence for bias and fairness</td>
    </tr>
    <tr>
      <td>Model Validation</td>
      <td>Model Drift</td>
      <td>Documentary evidence for drift testing</td>
    </tr>
    <tr>
      <td>Model Validation</td>
      <td>Model Performance</td>
      <td>Documentary evidence of model performance monitoring and alert thresholds</td>
    </tr>
    <tr>
      <td>Model Monitoring</td>
      <td>Monitoring</td>
      <td>Documentation of monitoring plan</td>
    </tr>
    <tr>
      <td>Model Recertification</td>
      <td>Use Case</td>
      <td>Have model's use case remained the same? If not, what changed?</td>
    </tr>
    <tr>
      <td>Model Recertification</td>
      <td>Data Sources</td>
      <td>Have model's inputs and data sources remained the same? If not, what changed?</td>
    </tr>
    <tr>
      <td>Model Recertification</td>
      <td>Outputs</td>
      <td>Have model's outputs and destinations remained the same? If not, what changed?</td>
    </tr>
    <tr>
      <td>Model Recertification</td>
      <td>Users</td>
      <td>Have model's users remained the same? If not, what changed?</td>
    </tr>
    <tr>
      <td>Model Recertification</td>
      <td>Components</td>
      <td>Have model's internal processing components and algorithms remained the same? If not, what changed?</td>
    </tr>
    <tr>
      <td>Model Recertification</td>
      <td>Compliance</td>
      <td>Have users completed required training on use of AI in models?</td>
    </tr>
    <tr>
      <td>Model Recertification</td>
      <td>Risk Assessment</td>
      <td>Has a comprehensive risk assessment been conducted on any use of AI? If so, please attach results.</td>
    </tr>
    <tr>
      <td>Issue Log</td>
      <td>Issue</td>
      <td>List of issues impacting the AI model</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 5: Model oversight and evidence</em>
</p>

## AI Model Relations

Table 6 summarizes the relations for the AI model with other objects.

<table align="center">
  <thead>
    <tr>
      <th><b>Asset</b></th>
      <th><b>Relation</b></th>
      <th><b>Asset</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>AI Model</td>
      <td>uses</td>
      <td>Data Source</td>
    </tr>
    <tr>
      <td>AI Model</td>
      <td>uses</td>
      <td>Tool</td>
    </tr>
    <tr>
      <td>AI Model</td>
      <td>is validated by</td>
      <td>Model Validation</td>
    </tr>
    <tr>
      <td>AI Model</td>
      <td>is monitored by</td>
      <td>Model Monitoring</td>
    </tr>
    <tr>
      <td>AI Model</td>
      <td>is recertified by</td>
      <td>Model Recertification</td>
    </tr>
    <tr>
      <td>AI Model</td>
      <td>is described by</td>
      <td>Documentation</td>
    </tr>
    <tr>
      <td>AI Model</td>
      <td>produces</td>
      <td>Output</td>
    </tr>
    <tr>
      <td>AI Model</td>
      <td>uses</td>
      <td>Agent</td>
    </tr>
    <tr>
      <td>AI Model</td>
      <td>is used by</td>
      <td>Agent</td>
    </tr>
    <tr>
      <td>AI Model</td>
      <td>is impacted by</td>
      <td>Issue</td>
    </tr>
    <tr>
      <td>AI Model</td>
      <td>is governed by</td>
      <td>Control</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 6: AI Model relations</em>
</p>


## Black Box Nature of Agents in Third-Party Models Present Unique Challenges for Agent Risk Assessments

Banks generally have robust model governance methodologies for in-house models. These methodologies include rigorous bias testing, back testing, and the use of challenger models. However, banks are often confronted with third-party models with embedded AI agents that may not provide clear line-of-sight for risk management purposes. Table 7 summarizes key considerations in risk assessments for third-party models that use AI agents.

<table align="center">
  <thead>
    <tr>
      <th><b>Consideration</b></th>
      <th><b>Description</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Model</td>
      <td>Name of the model</td>
    </tr>
    <tr>
      <td>Provider</td>
      <td>Name of the model provider</td>
    </tr>
    <tr>
      <td>Agent</td>
      <td>Name of the agent used by the model</td>
    </tr>
    <tr>
      <td>Agent Provider</td>
      <td>Name of the agent provider used by the model</td>
    </tr>
    <tr>
      <td>LLM</td>
      <td>Name and LLM version used by the agent</td>
    </tr>
    <tr>
      <td>Inputs</td>
      <td>List of inputs used by the agent</td>
    </tr>
    <tr>
      <td>Data Usage</td>
      <td>Will the provider use the bank's data to train its models and agents?</td>
    </tr>
    <tr>
      <td>Bias Testing</td>
      <td>Documentary evidence regarding bias testing of the model and agents (this is important for compliance purposes)</td>
    </tr>
    <tr>
      <td>Third-Party Risk Assessment</td>
      <td>Results of latest Third-Party Risk Assessment on the Model / Agent Provider</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 7: Key considerations for third-party models that use AI agents</em>
</p>

## Sample Guidance

Table 8 summarizes guidance that impacts AI agents within model risk management in banking.

<table align="center">
  <thead>
    <tr>
      <th><b>Regulator</b></th>
      <th><b>Guidance</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>U.S. Federal Reserve</td>
      <td><a href="https://www.federalreserve.gov/supervisionreg/srletters/sr1107.htm" target=_blank>SR 11-7: Guidance on Model Risk Management</a></td>
    </tr>
    <tr>
      <td>U.S. Federal Reserve</td>
      <td><a href="https://www.federalreserve.gov/supervisionreg/srletters/sr1207.htm" target="_blank">SR 12-7: Supervisory Guidance on Stress Testing for Banking Organizations with More Than $10 Billion in Total Consolidated Assets</a></td>
    </tr>
    <tr>
      <td>U.S. Department of Treasury</td>
      <td><a href="https://fsscc.org/wp-content/uploads/2026/02/AIEOG-AI-Lexicon-February-2026.pdf" target=_blank>Artificial Intelligence Executive Oversight Group AI Lexicon</a></td>
    </tr>
    <tr>
      <td>U.S. Department of Treasury</td>
      <td><a href="https://cyberriskinstitute.org/artificial-intelligence-risk-management/" target=_blank>Financial Services AI Risk Management Framework (FS AI RMF)</a></td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 8: Guidance impacting model risk management in banking</em>
</p>

## JSON Schema
Please refer to the [JSON schema](../schema/industry/banking-model-risk-management.json) that implements these enhancements for Model Risk Management in Banking.

## Contributors
[Antonio DiPerna, BankUnited](https://www.linkedin.com/in/antonio-di-perna-851153/)

[Arpan Patel, Delta Community Credit Union](https://www.linkedin.com/in/arpanpatel7/)

[Shyam Rasaily, T. Rowe Price](https://www.linkedin.com/in/shyam-rasaily-1b213245/)

[Dr. Su Rayburn, Delta Community Credit Union](https://www.linkedin.com/in/surayburn/)
