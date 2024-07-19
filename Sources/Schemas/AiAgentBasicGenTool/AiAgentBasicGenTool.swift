import Foundation

/// AI agent basic tool used to generate text.
public class AiAgentBasicGenTool: AiAgentLongTextTool {
    private enum CodingKeys: String, CodingKey {
        case contentTemplate = "content_template"
    }

    /// How the content should be included in a request to the LLM.
    /// When passing this parameter, you must include `{content}`.
    public let contentTemplate: String?

    /// Initializer for a AiAgentBasicGenTool.
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
    ///   - contentTemplate: How the content should be included in a request to the LLM.
    ///     When passing this parameter, you must include `{content}`.
    public init(model: String? = nil, systemMessage: String? = nil, promptTemplate: String? = nil, numTokensForCompletion: Int64? = nil, llmEndpointParams: AiLlmEndpointParamsGoogleOrAiLlmEndpointParamsOpenAi? = nil, embeddings: AiAgentLongTextToolEmbeddingsField? = nil, contentTemplate: String? = nil) {
        self.contentTemplate = contentTemplate

        super.init(model: model, systemMessage: systemMessage, promptTemplate: promptTemplate, numTokensForCompletion: numTokensForCompletion, llmEndpointParams: llmEndpointParams, embeddings: embeddings)
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        contentTemplate = try container.decodeIfPresent(String.self, forKey: .contentTemplate)

        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(contentTemplate, forKey: .contentTemplate)
        try super.encode(to: encoder)
    }

}
