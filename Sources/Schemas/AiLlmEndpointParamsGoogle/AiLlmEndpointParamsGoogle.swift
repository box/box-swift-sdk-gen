import Foundation

/// AI LLM endpoint params Google object
public class AiLlmEndpointParamsGoogle: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case temperature
        case topP = "top_p"
        case topK = "top_k"
    }

    /// The type of the AI LLM endpoint params object for Google.
    /// This parameter is **required**.
    public let type: AiLlmEndpointParamsGoogleTypeField

    /// The temperature is used for sampling during response generation, which occurs when `top-P` and `top-K` are applied. 
    /// Temperature controls the degree of randomness in token selection.
    public let temperature: Double?

    /// `Top-P` changes how the model selects tokens for output. Tokens are selected from the most (see `top-K`) to least probable
    /// until the sum of their probabilities equals the `top-P` value.
    public let topP: Double?

    /// `Top-K` changes how the model selects tokens for output. A `top-K` of 1 means the next selected token is
    /// the most probable among all tokens in the model's vocabulary (also called greedy decoding),
    /// while a `top-K` of 3 means that the next token is selected from among the three most probable tokens by using temperature.
    public let topK: Double?

    /// Initializer for a AiLlmEndpointParamsGoogle.
    ///
    /// - Parameters:
    ///   - type: The type of the AI LLM endpoint params object for Google.
    ///     This parameter is **required**.
    ///   - temperature: The temperature is used for sampling during response generation, which occurs when `top-P` and `top-K` are applied. 
    ///     Temperature controls the degree of randomness in token selection.
    ///   - topP: `Top-P` changes how the model selects tokens for output. Tokens are selected from the most (see `top-K`) to least probable
    ///     until the sum of their probabilities equals the `top-P` value.
    ///   - topK: `Top-K` changes how the model selects tokens for output. A `top-K` of 1 means the next selected token is
    ///     the most probable among all tokens in the model's vocabulary (also called greedy decoding),
    ///     while a `top-K` of 3 means that the next token is selected from among the three most probable tokens by using temperature.
    public init(type: AiLlmEndpointParamsGoogleTypeField = AiLlmEndpointParamsGoogleTypeField.googleParams, temperature: Double? = nil, topP: Double? = nil, topK: Double? = nil) {
        self.type = type
        self.temperature = temperature
        self.topP = topP
        self.topK = topK
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(AiLlmEndpointParamsGoogleTypeField.self, forKey: .type)
        temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
        topP = try container.decodeIfPresent(Double.self, forKey: .topP)
        topK = try container.decodeIfPresent(Double.self, forKey: .topK)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(temperature, forKey: .temperature)
        try container.encodeIfPresent(topP, forKey: .topP)
        try container.encodeIfPresent(topK, forKey: .topK)
    }

}
