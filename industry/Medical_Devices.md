# Updates to Agent Metadata for the Medical Device Industry

## Introduction

AI agents may be integrated with standalone software programs or with physical hardware. The U.S. Food & Drug Administration (FDA) defines [Software as a Medical Device](https://www.fda.gov/medical-devices/software-medical-device-samd/what-are-examples-software-medical-device) broadly to include software that allows a smartphone to view images obtained from a magnetic resonance imaging (MRI) medical device for diagnostic purposes and Computer-Aided Detection (CAD) software that performs image post-processing to help detect breast cancer. Software as a Medical Device may be interfaced with other medical devices, including hardware medical devices, and other software as a medical device software, as well as general purpose software.

## Conceptual Model Updates
Figure 1 shows key areas where the overall agent data model needs to be customized for the medical device industry.

<p align="center">
  <img src="../assets/images/Medical Devices.png" alt="Medical Devices" width="300" >
  <br>
  <em>Figure 1: Key aspects of agent metadata for the medical device industry</em>
</p>

## Additional Agent Attributes
Table 1 summarizes the attributes of an agent that are specific to the medical device industry.

<table>
  <thead>
    <tr>
      <th><b>Attribute</b></th>
      <th><b>Description</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Agent ID</td>
      <td>A unique, permanent identifier for the agent</td>
    </tr>
    <tr>
        <td>Name</td>
        <td>Name of the agent (e.g., Sepsis ImmunoScore)</td>
    </tr>
    <tr>
        <td>Is Medical Device</td>
        <td>Boolean indicating if the agent constitutes a medical device</td>
    </tr>
    <tr>
        <td>Universal Device Identifier (UDI)</td>
        <td>
            <p>A unique numeric or alphanumeric code that generally consists of the following:
            </p>
            <ul>
                <li>
                    Device identifier (DI), a mandatory, fixed portion of a <a href="https://www.fda.gov/medical-devices/unique-device-identification-system-udi-system/udi-basics" target="_blank">UDI</a> that identifies the labeler and the specific version or model of a device
                </li>
                <li>
                    Production identifier (PI), a conditional, variable portion of a UDI that identifies one or more of the following when included on the label of a device:
                    <ul>
                        <li>
                            Lot or batch number within which a device was manufactured
                        </li>
                        <li>
                            Serial number of a specific device
                        </li>
                        <li>
                            Expiration date of a specific device
                        </li>
                        <li>
                            Date a specific device was manufactured
                        </li>
                        <li>
                            Distinct identification code required for a human cell, tissue, or cellular and tissue-based product regulated as a device
                        </li>
                    </ul>
                </li>
            </ul>
        </td>
    </tr>
    <tr>
        <td>CMMS Number</td>
        <td>Computerized Maintenance Management System (CMMS) Number ex. Asset Information Management System (AIMS) Number</td>
    </tr>
    <tr>
        <td>FDA Device Classification</td>
        <td>Software device to aid in the prediction or diagnosis of sepsis</td>
    </tr>
    <tr>
        <td>FDA Device Classification Description</td>
        <td>Description of the FDA classification. For <a href=https://www.accessdata.fda.gov/scripts/cdrh/cfdocs/cfpcd/classification.cfm?id=2354 target="_blank">example</a>: A software device to aid in the prediction or diagnosis of sepsis uses advanced algorithms to analyze patient specific data to aid health care providers in the prediction and/or diagnosis of sepsis. The device is intended for adjunctive use and is not intended to be used as the sole determining factor in assessing a patient's sepsis status. The device may contain alarms that alert the care provider of the patient's status. The device is not intended to monitor response to treatment in patients being treated for sepsis.</td>
    </tr>
    <tr>
        <td>IMDRF Risk Categorization</td>
        <td>The International Medical Device Regulators Forum (IMDRF) Software as a Medical Device Working Group (WG) published a possible risk categorization framework for Software as a Medical Device. The Software as a Medical Device  risk categorization framework has four categories (I, II, III, and IV).  These categories are based on the levels of impact on the patient or public health where accurate information provided by the Software as a Medical Device to treat or diagnose, drive or inform clinical management is vital to avoid death, long-term disability. or other serious deterioration of health, mitigating public health. The Level IV category is Software as a Medical Device with the highest impact on the patient or public health and Level I is the lowest.</td>
    </tr>
    <tr>
        <td>Uses PII</td>
        <td>Boolean indicating if the agent uses Personally Identifiable Information (PII)</td>
    </tr>
    <tr>
        <td>Uses PHI</td>
        <td>Boolean indicating if the agent uses Protected Health Information (PHI)</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 1: Agent attributes for the medical device industry</em>
</p>

## Additional Medical Device Attributes
Table 2 summarizes the attributes of a device that are specific to the medical device industry.

<table>
  <thead>
    <tr>
      <th><b>Attribute</b></th>
      <th><b>Description</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Physical State</td>
      <td>Physical state of the medical device (e.g., Software Device)</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 2: Medical device attributes for the medical device industry</em>
</p>

## Sample Regulations
Table 3 provides a sample of regulations that impact AI agents in the medical device industry.

<table>
  <thead>
    <tr>
      <th><b>Regulator</b></th>
      <th><b>Regulation</b></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>U.S. Food and Drug Administration</td>
      <td><a href="https://www.fda.gov/medical-devices/digital-health-center-excellence/software-medical-device-samd" target="_blank">Software as a Medical Device (SaMD)</a></td>
    </tr>
    <tr>
      <td>IMDRF Software as a Medical Device (SaMD) Working Group</td>
      <td>"Software as a Medical Device": Possible Framework for Risk Categorization and Corresponding Considerations, September 18, 2014</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 3: Regulations impacting agents in the medical device industry</em>
</p>

## Additional Relations
Table 4 summarizes the additional relations in the medical device industry.

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
      <td>Medical Device</td>
    </tr>
    <tr>
      <td>Medical Device</td>
      <td>uses</td>
      <td>Agent</td>
    </tr>
  </tbody>
</table>
<p align="center">
  <em>Table 4: Additional relations for the medical device industry</em>
</p>

## JSON Schema

Please refer to the [JSON schema](../schema/industry/medical-device-manufacturer-schema.json) that implements these enhancements for the Medical Device industry.

## Contributors:

[Joe DeLuca](https://www.linkedin.com/in/joseph-deluca-0717411b/)

[Mike Jennings](https://www.linkedin.com/in/mikefjennings/)