# AiStudioManager


- [List AI agents](#list-ai-agents)
- [Create AI agent](#create-ai-agent)
- [Update AI agent](#update-ai-agent)
- [Get AI agent by agent ID](#get-ai-agent-by-agent-id)
- [Delete AI agent](#delete-ai-agent)

## List AI agents

Lists AI agents based on the provided parameters.

This operation is performed by calling function `getAiAgents`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-ai-agents/).

<!-- sample get_ai_agents -->
```
try await client.aiStudio.getAiAgents()
```

### Arguments

- queryParams `GetAiAgentsQueryParams`
  - Query parameters of getAiAgents method
- headers `GetAiAgentsHeaders`
  - Headers of getAiAgents method


### Returns

This function returns a value of type `AiMultipleAgentResponse`.

A successful response including the agents list.


## Create AI agent

Creates an AI agent. At least one of the following capabilities must be provided: `ask`, `text_gen`, `extract`.

This operation is performed by calling function `createAiAgent`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-ai-agents/).

<!-- sample post_ai_agents -->
```
try await client.aiStudio.createAiAgent(requestBody: CreateAiAgent(name: agentName, accessState: "enabled", ask: AiStudioAgentAsk(accessState: "enabled", description: "desc1")))
```

### Arguments

- requestBody `CreateAiAgent`
  - Request body of createAiAgent method
- headers `CreateAiAgentHeaders`
  - Headers of createAiAgent method


### Returns

This function returns a value of type `AiSingleAgentResponseFull`.

Definition of created AI agent.


## Update AI agent

Updates an AI agent.

This operation is performed by calling function `updateAiAgentById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/put-ai-agents-id/).

<!-- sample put_ai_agents_id -->
```
try await client.aiStudio.updateAiAgentById(agentId: createdAgent.id, requestBody: CreateAiAgent(name: agentName, accessState: "enabled", ask: AiStudioAgentAsk(accessState: "disabled", description: "desc2")))
```

### Arguments

- agentId `String`
  - The ID of the agent to update. Example: "1234"
- requestBody `CreateAiAgent`
  - Request body of updateAiAgentById method
- headers `UpdateAiAgentByIdHeaders`
  - Headers of updateAiAgentById method


### Returns

This function returns a value of type `AiSingleAgentResponseFull`.

Definition of created AI agent.


## Get AI agent by agent ID

Gets an AI Agent using the `agent_id` parameter.

This operation is performed by calling function `getAiAgentById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-ai-agents-id/).

<!-- sample get_ai_agents_id -->
```
try await client.aiStudio.getAiAgentById(agentId: createdAgent.id, queryParams: GetAiAgentByIdQueryParams(fields: ["ask"]))
```

### Arguments

- agentId `String`
  - The agent id to get. Example: "1234"
- queryParams `GetAiAgentByIdQueryParams`
  - Query parameters of getAiAgentById method
- headers `GetAiAgentByIdHeaders`
  - Headers of getAiAgentById method


### Returns

This function returns a value of type `AiSingleAgentResponseFull`.

A successful response including the agent.


## Delete AI agent

Deletes an AI agent using the provided parameters.

This operation is performed by calling function `deleteAiAgentById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/delete-ai-agents-id/).

<!-- sample delete_ai_agents_id -->
```
try await client.aiStudio.deleteAiAgentById(agentId: createdAgent.id)
```

### Arguments

- agentId `String`
  - The ID of the agent to delete. Example: "1234"
- headers `DeleteAiAgentByIdHeaders`
  - Headers of deleteAiAgentById method


### Returns

This function returns a value of type ``.

A successful response with no content.


