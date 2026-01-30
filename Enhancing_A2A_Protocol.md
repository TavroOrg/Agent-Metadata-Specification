# Enhancing Google Agent2Agent (A2A) Protocol

The Google Agent2Agent (A2A) is an open protocol that provides a standard way for agents to collaborate with each other, regardless of the underlying framework or vendor. Agents can advertise their capabilities using an "Agent Card" in JSON format, allowing the client agent to identify the best agent that can perform a task and leverage A2A to communicate with the remote agent.

The Agent Card lays the operational foundation for agents to find each other, understand basic capabilities (modalities), and handshake for collaboration. However, the Agent Card does not address the business context, risk management, and governance. 

The Agent Metadata Specification seeks to enhance the Google Agent Card to address these additional topics. See the latest [PDF](/assets/Publications/Agent%20Metadata%20Specification%20V0.2.5.pdf) and [JSON schema](schema/v0.2.5/agent-schema.json).
