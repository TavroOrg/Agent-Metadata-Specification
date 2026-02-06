# Agent Metadata for Model Risk Management in Banking

## Introduction

The cross-industry Agent Metadata Specification is published [here](https://github.com/TavroOrg/Agent-Metadata-Specification/tree/main/assets/Publications). This section provides additional attributes that apply to Model Risk Management in Banking.

This section is only a stub and will be built out based on future input from industry leaders. Because AI agents are increasingly being used for Model Risk Management in banking, their metadata needs to be captured and their risk assessed appropriately.

## Conceptual Model Updates
Banks use models for multiple use cases including credit risk, liquidity risk, and operational risk. These models may be Excel files, AI/ML models, or third-party models. These models may increasingly use agents. Figure 1 shows key areas where the overall agent data model needs to be customized for model risk management in banking.

<p align="center">
  <img src="../assets/images/Banking Model Risk Management.png" alt="Banking Model Risk Management" width="300" >
  <br>
  <em>Figure 1: Key aspects of agent metadata for model risk management in banking</em>
</p>

## Model Attributes
Table 1 summarizes the attributes of a model that are specific to model risk management in banking.

<table>
  <thead>
    <tr>
      <th><b>Category</b></th>
      <th><b>Attribute</b></th>
      <th><b>Description</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Identification</td>
      <td>Name</td>
      <td>Name of the model that uses the agent</td>
    </tr>
    <tr>
      <td>Identification</td>
      <td>Owner</td>
      <td>Name of the owner of the model that uses the agent</td>
    </tr>
    <tr>
      <td>Identification</td>
      <td>Department Executive</td>
      <td>Name of the department executive of the model that uses the agent</td>
    </tr>
    <tr>
      <td>Identification</td>
      <td>Description</td>
      <td>Description of the model that uses the agent</td>
    </tr>
    <tr>
      <td>Identification</td>
      <td>Vendor or In-house</td>
      <td>Whether the model is offered by a vendor or built in-house</td>
    </tr>
    <tr>
      <td>Identification</td>
      <td>Using Departments</td>
      <td>Names of the departments that will be using the model</td>
    </tr>
    <tr>
      <td>Identification</td>
      <td>Status</td>
      <td>Current lifecycle of the model (e.g., Ideation, Development, Production, Retired)</td>
    </tr>
    <tr>
      <td>Lineage</td>
      <td>Inputs</td>
      <td>List of inputs for the model</td>
    </tr>
    <tr>
      <td>Lineage</td>
      <td>Data Sources</td>
      <td>List of data sources for the model</td>
    </tr>
    <tr>
      <td>Lineage</td>
      <td>Users</td>
      <td>Types of users for the model</td>
    </tr>
    <tr>
      <td>Lineage</td>
      <td>Outputs</td>
      <td>List of outputs for the model</td>
    </tr>
    <tr>
      <td>Lineage</td>
      <td>Destinations</td>
      <td>List of destinations for the model</td>
    </tr>
    <tr>
      <td>Compliance</td>
      <td>Training</td>
      <td>Have users completed required American Bankers Association (ABA) training on use of AI in models?</td>
    </tr>
    <tr>
      <td>Model Validation</td>
      <td>Date</td>
      <td>Date of last model validation</td>
    </tr>
    <tr>
      <td>Model Validation</td>
      <td>Evidence</td>
      <td>Documentary evidence of model validation</td>
    </tr>
    <tr>
      <td>Recertification</td>
      <td>Identification</td>
      <td>Have model’s use case remained the same? If not, what changed?</td>
    </tr>
    <tr>
      <td>Recertification</td>
      <td>Lineage</td>
      <td>Have model’s inputs and data sources remained the same? If not, what changed?</td>
    </tr>
    <tr>
      <td>Recertification</td>
      <td>Lineage</td>
      <td>Have model’s outputs and destinations remained the same? If not, what changed?</td>
    </tr>
    <tr>
      <td>Recertification</td>
      <td>Lineage</td>
      <td>Have model’s users remained the same? If not, what changed?</td>
    </tr>
    <tr>
      <td>Recertification</td>
      <td>Processing Components</td>
      <td>Have model’s internal processing components and algorithms remained the same? If not, what changed?</td>
    </tr>
    <tr>
      <td>Recertification</td>
      <td>Compliance</td>
      <td>Have users completed required training on use of AI in models?</td>
    </tr>
    <tr>
      <td>Recertification</td>
      <td>Risk Assessment</td>
      <td>Has a comprehensive risk assessment been conducted on any use of AI? If so, please attach results.</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 1: Agent attributes for the model risk management in banking</em>
</p>

## Black Box Nature of Agents in Third-Party Models Present Unique Challenges for Agent Risk Assessments

Banks generally have robust model governance methodologies for in-house models. These methodologies include rigorous bias testing, back testing, and the use of challenger models. However, banks are often confronted with third-party models with embedded AI agents that may not provide clear line-of-sight for risk management purposes. Table 2 summarizes key attributes that need to be considered in risk assessments for third-party models that use AI agents.

<table>
  <thead>
    <tr>
      <th><b>Attribute</b></th>
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
  <em>Table 2: Risk assessment attributes for model and agent</em>
</p>

## Additional Relations
Table 3 summarizes the additional relations for model risk management in banking.

<table>
  <thead>
    <tr>
      <th><b>Asset</b></th>
      <th><b>Relation</b></th>
      <th><b>Asset</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Agent</td>
      <td>is used by</td>
      <td>Model</td>
    </tr>
    <tr>
      <td>Model</td>
      <td>uses</td>
      <td>Agent</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 3: Additional relations for model risk management in banking</em>
</p>

## Sample Regulations
Table 4 summarizes regulations that impact AI agents within model risk management in banking.

<table>
  <thead>
    <tr>
      <th><b>Regulator</b></th>
      <th><b>Regulation</b></th>
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
  </tbody>
</table>
<p align="center">
  <em>Table 4: Regulations impacting model risk management in banking</em>
</p>

## JSON Schema
Please refer to the [JSON schema](../schema/industry/banking-model-risk-management.json) that implements these enhancements for Model Risk Management in Banking.

## Contributors
[Antonio DiPerna, BankUnited](https://www.linkedin.com/in/antonio-di-perna-851153/)

[Arpan Patel, Delta Community Credit Union](https://www.linkedin.com/in/arpanpatel7/)

[Dr. Su Rayburn, Delta Community Credit Union](https://www.linkedin.com/in/surayburn/)