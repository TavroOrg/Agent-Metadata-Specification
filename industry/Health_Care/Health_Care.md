# Agent Metadata for Health Care

## Introduction

The cross-industry Agent Metadata Specification is published [here](https://github.com/TavroOrg/Agent-Metadata-Specification/tree/main/assets/Publications). This section provides a basic introduction and will be built out based on future input from industry leaders.

## Potential Areas of Focus for Health Care

The following are potential areas of focus around Agent Metadata for Health Care:

### 1. Use of Medical Devices with AI Agents Necessitates Taxonomy of Agent Cards
The section on the [Medical Device Industry](https://github.com/TavroOrg/Agent-Metadata-Specification/blob/main/industry/Medical_Devices.md) showcases the importance of mapping of medical devices to agents. Medical professionals may, for example, use infrared vein-finding devices to enhance intravenous (IV) insertion by projecting real-time, high-definition vein maps on the skin. These devices may use AI agents that now have access to Protected Health Information (PHI). This introduces AI agent risks that need to be managed appropriately. 

The cross-industry Agent Metadata Specification discusses a taxonomy of Agent Cards that may be based on Google’s Agent2Agent (A2A) protocol. This concept of Agent Cards needs to be elevated to address broader agent risk considerations including for Physical AI (medical devices) as shown in Figure 1. This approach would facilitate a unified view of agent risk for a given medical device.

<p align="center">
  <img src="../../assets/images/Agent Card Taxonomy.png" alt="Medical Devices" width="600" >
  <br>
  <em>Figure 1: Taxonomy of agent cards</em>
</p>

### 2. Updates to HIPAA Security Rule for Agent Risk
The U.S. Department of Health and Human Services has proposed modifications to the [Health Insurance Portability and Accountability Act (HIPAA) Security Rule](https://www.hhs.gov/hipaa/for-professionals/security/hipaa-security-rule-nprm/factsheet/index.html) to require health plans, health care clearinghouses, and most health care providers, and their business associates, to strengthen cybersecurity protections for individuals' protected health information. The proposed HIPAA Security Rule removes the distinction between "required" and "addressable" implementation specifications and makes all implementation specifications required with specific, limited exceptions.

Table 1 summarizes key requirements from the HIPAA Security Rule with applicability to AI agents.

<table>
  <thead>
    <tr>
      <th><b>HIPAA Security Rule Requirement</b></th>
      <th><b>Applicability to AI Agents</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Require written documentation of all Security Rule policies, procedures, plans, and analyses.</td>
      <td>Include policies and standards for AI agents including agent metadata, agent cards, and agent risk assessments.</td>
    </tr>
    <tr>
      <td>Require the development and revision of a technology asset inventory and a network map that illustrates the movement of ePHI throughout the regulated entity's electronic information system(s) on an ongoing basis, but at least once every 12 months and in response to a change in the regulated entity's environment or operations that may affect Electronic PHI (ePHI).</td>
      <td>Map agent metadata and lineage.</td>
    </tr>
    <tr>
      <td>
        Require greater specificity for conducting a risk analysis. New express requirements would include a written assessment that contains, among other things:
        <ul>
          <li>A review of the technology asset inventory and network map</li>
          <li>Identification of all reasonably anticipated threats to the confidentiality, integrity, and availability of ePHI</li>
          <li>Identification of potential vulnerabilities and predisposing conditions to the regulated entity's relevant electronic information systems</li>
          <li>An assessment of the risk level for each identified threat and vulnerability, based on the likelihood that each identified threat will exploit the identified vulnerabilities</li>
        </ul>
      </td>
      <td>Conduct agent risk assessments on a periodic basis including Fourth-Party Risk Identification (subcontractors of the AI vendor), which are often missed in traditional audits.</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 1: Mapping of the requirements of the HIPAA Security Rule to AI Agents</em>
</p>

### 3. The Role of The Joint Commission
The [Joint Commission](https://www.jointcommission.org/en-us) and the Coalition for Health AI (CHAI) has published guidance on the [Responsible Use of AI in Healthcare (RUAIH)](https://digitalassets.jointcommission.org/api/public/content/dcfcf4f1a0cc45cdb526b3cb034c68c2). The RUAIH guidance includes the following elements, all of which need to address the risks associated with AI agents:
<ol type="i">
  <li>AI Policies and Governance Structures</li>
  <li>Patient Privacy and Transparency</li>
  <li>Data Security and Data Use Protections</li>
  <li>Ongoing Quality Monitoring</li>
  <li>Voluntary, Blinded Reporting of AI Safety-Related Events</li>
  <li>Risk and Bias Assessment</li>
  <li>Education and Training</li>
</ol>

## Sample Regulations and Frameworks

Table 2 provides a sample of regulations and frameworks that impact AI agents in health care.

<table>
  <thead>
    <tr>
      <th><b>Regulator</b></th>
      <th><b>Regulation</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>U.S. Department of Health and Human Services (HHS)</td>
      <td><a href="https://www.hhs.gov/hipaa/for-professionals/security/hipaa-security-rule-nprm/factsheet/index.html" target="_blank">HIPAA Security Rule</a></td>
    </tr>
    <tr>
      <td>Joint Commission</td>
      <td><a href="https://digitalassets.jointcommission.org/api/public/content/dcfcf4f1a0cc45cdb526b3cb034c68c2" target="_blank">Responsible Use of AI in Healthcare (RUAIH)</a></td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 2: Regulations impacting agents in health care</em>
</p>

## Contributors:

[Joe DeLuca](https://www.linkedin.com/in/joseph-deluca-0717411b/)

[Mike Jennings](https://www.linkedin.com/in/mikefjennings/)
