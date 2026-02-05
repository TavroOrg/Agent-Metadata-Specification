# Enhancing Google Agent2Agent (A2A) Protocol

The Google [Agent2Agent (A2A)](https://developers.googleblog.com/en/a2a-a-new-era-of-agent-interoperability/) is an open protocol that provides a standard way for agents to collaborate with each other, regardless of the underlying framework or vendor. Agents can advertise their capabilities using an "Agent Card" in JSON format, allowing the client agent to identify the best agent that can perform a task and leverage A2A to communicate with the remote agent.

The Agent Card lays the operational foundation for agents to find each other, understand basic capabilities (modalities), and handshake for collaboration. However, the Agent Card does not address the business context, risk management, and governance.

The Agent Metadata Specification seeks to enhance the Google Agent Card to address these additional topics.


See examples for an A2A Agent Card implemented for an agent with:
- [OOTB attributes](./examples/Fraud%20Detective%20-%20Agent%20Card.json) only
- [Extended Authenticated Attributes](./examples/Fraud%20Detective%20-%20Authenticated%20Agent%20Card.json), which would require specific authentication
