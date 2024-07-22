import Foundation

/// AI agent tool used to to handle longer text.
public class AiAgentLongTextTool: AiAgentBasicTextToolTextGen {
    private enum CodingKeys: String, CodingKey {
        case embeddings
    }

    public let embeddings: AiAgentLongTextToolEmbeddingsField?

    /// Initializer for a AiAgentLongTextTool.
    ///
    /// - Parameters:
    ///   - model: The model to be used for the AI Agent for basic text.
    ///   - systemMessage: System messages try to help the LLM "understand" its role and what it is supposed to do.
    ///     This parameter requires using `{current_date}`.
    ///   - promptTemplate: The prompt template contains contextual information of the request and the user prompt.
    ///     
    ///     When using the `prompt_template` parameter, you **must include** input for `{user_question}`.
    ///     Inputs for  `{current_date}` and`{content}` are optional, depending on the use.
    ///   - numTokensForCompletion: The number of tokens for completion.
    ///   - llmEndpointParams: 
    ///   - embeddings: 
    public init(model: String? = nil, systemMessage: String? = nil, promptTemplate: String? = nil, numTokensForCompletion: Int64? = nil, llmEndpointParams: AiLlmEndpointParamsGoogleOrAiLlmEndpointParamsOpenAi? = nil, embeddings: AiAgentLongTextToolEmbeddingsField? = nil) {
        self.embeddings = embeddings

        super.init(model: model, systemMessage: systemMessage, promptTemplate: promptTemplate, numTokensForCompletion: numTokensForCompletion, llmEndpointParams: llmEndpointParams)
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        embeddings = try container.decodeIfPresent(AiAgentLongTextToolEmbeddingsField.self, forKey: .embeddings)

        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(embeddings, forKey: .embeddings)
        try super.encode(to: encoder)
    }

}
