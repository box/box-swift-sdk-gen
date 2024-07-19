import Foundation

/// AI agent tool used to handle basic text.
public class AiAgentBasicTextToolTextGen: Codable {
    private enum CodingKeys: String, CodingKey {
        case model
        case systemMessage = "system_message"
        case promptTemplate = "prompt_template"
        case numTokensForCompletion = "num_tokens_for_completion"
        case llmEndpointParams = "llm_endpoint_params"
    }

    /// The model to be used for the AI Agent for basic text.
    public let model: String?

    /// System messages try to help the LLM "understand" its role and what it is supposed to do.
    /// This parameter requires using `{current_date}`.
    public let systemMessage: String?

    /// The prompt template contains contextual information of the request and the user prompt.
    /// 
    /// When using the `prompt_template` parameter, you **must include** input for `{user_question}`.
    /// Inputs for  `{current_date}` and`{content}` are optional, depending on the use.
    public let promptTemplate: String?

    /// The number of tokens for completion.
    public let numTokensForCompletion: Int64?

    public let llmEndpointParams: AiLlmEndpointParamsGoogleOrAiLlmEndpointParamsOpenAi?

    /// Initializer for a AiAgentBasicTextToolTextGen.
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
    public init(model: String? = nil, systemMessage: String? = nil, promptTemplate: String? = nil, numTokensForCompletion: Int64? = nil, llmEndpointParams: AiLlmEndpointParamsGoogleOrAiLlmEndpointParamsOpenAi? = nil) {
        self.model = model
        self.systemMessage = systemMessage
        self.promptTemplate = promptTemplate
        self.numTokensForCompletion = numTokensForCompletion
        self.llmEndpointParams = llmEndpointParams
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        model = try container.decodeIfPresent(String.self, forKey: .model)
        systemMessage = try container.decodeIfPresent(String.self, forKey: .systemMessage)
        promptTemplate = try container.decodeIfPresent(String.self, forKey: .promptTemplate)
        numTokensForCompletion = try container.decodeIfPresent(Int64.self, forKey: .numTokensForCompletion)
        llmEndpointParams = try container.decodeIfPresent(AiLlmEndpointParamsGoogleOrAiLlmEndpointParamsOpenAi.self, forKey: .llmEndpointParams)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(model, forKey: .model)
        try container.encodeIfPresent(systemMessage, forKey: .systemMessage)
        try container.encodeIfPresent(promptTemplate, forKey: .promptTemplate)
        try container.encodeIfPresent(numTokensForCompletion, forKey: .numTokensForCompletion)
        try container.encodeIfPresent(llmEndpointParams, forKey: .llmEndpointParams)
    }

}
