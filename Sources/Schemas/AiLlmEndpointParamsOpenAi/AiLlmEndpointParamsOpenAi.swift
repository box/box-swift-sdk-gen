import Foundation

/// AI LLM endpoint params OpenAI object.
public class AiLlmEndpointParamsOpenAi: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case temperature
        case topP = "top_p"
        case frequencyPenalty = "frequency_penalty"
        case presencePenalty = "presence_penalty"
        case stop
    }

    /// The type of the AI LLM endpoint params object for OpenAI.
    /// This parameter is **required**.
    public let type: AiLlmEndpointParamsOpenAiTypeField

    /// What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, 
    /// while lower values like 0.2 will make it more focused and deterministic. 
    /// We generally recommend altering this or `top_p` but not both.
    public let temperature: Double?

    /// An alternative to sampling with temperature, called nucleus sampling, where the model considers the results 
    /// of the tokens with `top_p` probability mass. So 0.1 means only the tokens comprising the top 10% probability 
    /// mass are considered. We generally recommend altering this or temperature but not both.
    public let topP: Double?

    /// Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency in the 
    /// text so far, decreasing the model's likelihood to repeat the same line verbatim.
    public let frequencyPenalty: Double?

    /// Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far, 
    /// increasing the model's likelihood to talk about new topics.
    public let presencePenalty: Double?

    /// Up to 4 sequences where the API will stop generating further tokens.
    public let stop: String?

    /// Initializer for a AiLlmEndpointParamsOpenAi.
    ///
    /// - Parameters:
    ///   - type: The type of the AI LLM endpoint params object for OpenAI.
    ///     This parameter is **required**.
    ///   - temperature: What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, 
    ///     while lower values like 0.2 will make it more focused and deterministic. 
    ///     We generally recommend altering this or `top_p` but not both.
    ///   - topP: An alternative to sampling with temperature, called nucleus sampling, where the model considers the results 
    ///     of the tokens with `top_p` probability mass. So 0.1 means only the tokens comprising the top 10% probability 
    ///     mass are considered. We generally recommend altering this or temperature but not both.
    ///   - frequencyPenalty: Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency in the 
    ///     text so far, decreasing the model's likelihood to repeat the same line verbatim.
    ///   - presencePenalty: Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far, 
    ///     increasing the model's likelihood to talk about new topics.
    ///   - stop: Up to 4 sequences where the API will stop generating further tokens.
    public init(type: AiLlmEndpointParamsOpenAiTypeField = AiLlmEndpointParamsOpenAiTypeField.openaiParams, temperature: Double? = nil, topP: Double? = nil, frequencyPenalty: Double? = nil, presencePenalty: Double? = nil, stop: String? = nil) {
        self.type = type
        self.temperature = temperature
        self.topP = topP
        self.frequencyPenalty = frequencyPenalty
        self.presencePenalty = presencePenalty
        self.stop = stop
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(AiLlmEndpointParamsOpenAiTypeField.self, forKey: .type)
        temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
        topP = try container.decodeIfPresent(Double.self, forKey: .topP)
        frequencyPenalty = try container.decodeIfPresent(Double.self, forKey: .frequencyPenalty)
        presencePenalty = try container.decodeIfPresent(Double.self, forKey: .presencePenalty)
        stop = try container.decodeIfPresent(String.self, forKey: .stop)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(temperature, forKey: .temperature)
        try container.encodeIfPresent(topP, forKey: .topP)
        try container.encodeIfPresent(frequencyPenalty, forKey: .frequencyPenalty)
        try container.encodeIfPresent(presencePenalty, forKey: .presencePenalty)
        try container.encodeIfPresent(stop, forKey: .stop)
    }

}
