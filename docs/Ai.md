# AiManager


- [Send AI question request](#send-ai-question-request)
- [Send AI request to generate text](#send-ai-request-to-generate-text)
- [Get AI agent default configuration](#get-ai-agent-default-configuration)

## Send AI question request

Sends an AI request to supported LLMs and returns an answer specifically focused on the user's question given the provided context.

This operation is performed by calling function `createAiAsk`.



```
try await client.ai.createAiAsk(requestBody: AiAsk(mode: AiAskModeField.multipleItemQa, prompt: "Which direction sun rises?", items: [AiAskItemsField(id: fileToAsk1.id, type: AiAskItemsTypeField.file, content: "Earth goes around the sun"), AiAskItemsField(id: fileToAsk2.id, type: AiAskItemsTypeField.file, content: "Sun rises in the East in the morning")]))
```

### Arguments

- requestBody `AiAsk`
  - Request body of createAiAsk method
- headers `CreateAiAskHeaders`
  - Headers of createAiAsk method


### Returns

This function returns a value of type `AiAskResponse`.

A successful response including the answer from the LLM.


## Send AI request to generate text

Sends an AI request to supported LLMs and returns an answer specifically focused on the creation of new text.

This operation is performed by calling function `createAiTextGen`.



```
try await client.ai.createAiTextGen(requestBody: AiTextGen(prompt: "Parapharse the document.s", items: [AiTextGenItemsField(id: fileToAsk.id, type: AiTextGenItemsTypeField.file, content: "The Earth goes around the sun. Sun rises in the East in the morning.")], dialogueHistory: [AiDialogueHistory(prompt: "What does the earth go around?", answer: "The sun", createdAt: try Utils.Dates.dateTimeFromString(dateTime: "2021-01-01T00:00:00Z")), AiDialogueHistory(prompt: "On Earth, where does the sun rise?", answer: "East", createdAt: try Utils.Dates.dateTimeFromString(dateTime: "2021-01-01T00:00:00Z"))]))
```

### Arguments

- requestBody `AiTextGen`
  - Request body of createAiTextGen method
- headers `CreateAiTextGenHeaders`
  - Headers of createAiTextGen method


### Returns

This function returns a value of type `AiResponse`.

A successful response including the answer from the LLM.


## Get AI agent default configuration

Get the AI agent default config

This operation is performed by calling function `getAiAgentDefaultConfig`.



```
try await client.ai.getAiAgentDefaultConfig(queryParams: GetAiAgentDefaultConfigQueryParams(mode: GetAiAgentDefaultConfigQueryParamsModeField.textGen, language: "en-US"))
```

### Arguments

- queryParams `GetAiAgentDefaultConfigQueryParams`
  - Query parameters of getAiAgentDefaultConfig method
- headers `GetAiAgentDefaultConfigHeaders`
  - Headers of getAiAgentDefaultConfig method


### Returns

This function returns a value of type `AiAgentAskOrAiAgentTextGen`.

A successful response including the default agent configuration.
This response can be one of the following two objects:
AI agent for questions and AI agent for text generation. The response
depends on the agent configuration requested in this endpoint.


