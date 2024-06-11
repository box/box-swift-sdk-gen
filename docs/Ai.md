# AiManager


- [Send AI question request](#send-ai-question-request)
- [Send AI request to generate text](#send-ai-request-to-generate-text)

## Send AI question request

Sends an AI request to supported LLMs and returns an answer specifically focused on the user's question given the provided context.

This operation is performed by calling function `createAiAsk`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-ai-ask/).

<!-- sample post_ai_ask -->
```
try await client.ai.createAiAsk(requestBody: AiAsk(mode: AiAskModeField.multipleItemQa, prompt: "Which direction sun rises?", items: [AiAskItemsField(id: fileToAsk1.id, type: AiAskItemsTypeField.file, content: "Earth goes around the sun"), AiAskItemsField(id: fileToAsk2.id, type: AiAskItemsTypeField.file, content: "Sun rises in the East in the morning")]))
```

### Arguments

- requestBody `AiAsk`
  - Request body of createAiAsk method
- headers `CreateAiAskHeaders`
  - Headers of createAiAsk method


### Returns

This function returns a value of type `AiResponse`.

A successful response including the answer from the LLM.


## Send AI request to generate text

Sends an AI request to supported LLMs and returns an answer specifically focused on the creation of new text.

This operation is performed by calling function `createAiTextGen`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-ai-text-gen/).

<!-- sample post_ai_text_gen -->
```
try await client.ai.createAiTextGen(requestBody: AiTextGen(prompt: "Parapharse the document.s", items: [AiTextGenItemsField(id: fileToAsk.id, type: AiTextGenItemsTypeField.file, content: "The Earth goes around the sun. Sun rises in the East in the morning.")], dialogueHistory: [AiTextGenDialogueHistoryField(prompt: "What does the earth go around?", answer: "The sun", createdAt: try Utils.Dates.dateTimeFromString(dateTime: "2021-01-01T00:00:00Z")), AiTextGenDialogueHistoryField(prompt: "On Earth, where does the sun rise?", answer: "East", createdAt: try Utils.Dates.dateTimeFromString(dateTime: "2021-01-01T00:00:00Z"))]))
```

### Arguments

- requestBody `AiTextGen`
  - Request body of createAiTextGen method
- headers `CreateAiTextGenHeaders`
  - Headers of createAiTextGen method


### Returns

This function returns a value of type `AiResponse`.

A successful response including the answer from the LLM.


