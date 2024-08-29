import Foundation

/// AI agent tool used to handle basic text.
public class AiAgentBasicTextToolBase: Codable {
    private enum CodingKeys: String, CodingKey {
        case model
        case numTokensForCompletion = "num_tokens_for_completion"
        case llmEndpointParams = "llm_endpoint_params"
    }

    /// The model used for the AI Agent for basic text.
    public let model: String?

    /// The number of tokens for completion.
    public let numTokensForCompletion: Int64?

    /// The parameters for the LLM endpoint specific to OpenAI / Google models.
    public let llmEndpointParams: AiLlmEndpointParamsGoogleOrAiLlmEndpointParamsOpenAi?

    /// Initializer for a AiAgentBasicTextToolBase.
    ///
    /// - Parameters:
    ///   - model: The model used for the AI Agent for basic text.
    ///   - numTokensForCompletion: The number of tokens for completion.
    ///   - llmEndpointParams: The parameters for the LLM endpoint specific to OpenAI / Google models.
    public init(model: String? = nil, numTokensForCompletion: Int64? = nil, llmEndpointParams: AiLlmEndpointParamsGoogleOrAiLlmEndpointParamsOpenAi? = nil) {
        self.model = model
        self.numTokensForCompletion = numTokensForCompletion
        self.llmEndpointParams = llmEndpointParams
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        model = try container.decodeIfPresent(String.self, forKey: .model)
        numTokensForCompletion = try container.decodeIfPresent(Int64.self, forKey: .numTokensForCompletion)
        llmEndpointParams = try container.decodeIfPresent(AiLlmEndpointParamsGoogleOrAiLlmEndpointParamsOpenAi.self, forKey: .llmEndpointParams)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(model, forKey: .model)
        try container.encodeIfPresent(numTokensForCompletion, forKey: .numTokensForCompletion)
        try container.encodeIfPresent(llmEndpointParams, forKey: .llmEndpointParams)
    }

}