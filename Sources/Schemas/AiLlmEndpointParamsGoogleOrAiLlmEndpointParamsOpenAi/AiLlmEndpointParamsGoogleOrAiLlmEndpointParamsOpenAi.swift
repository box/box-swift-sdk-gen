import Foundation

public enum AiLlmEndpointParamsGoogleOrAiLlmEndpointParamsOpenAi: Codable {
    case aiLlmEndpointParamsGoogle(AiLlmEndpointParamsGoogle)
    case aiLlmEndpointParamsOpenAi(AiLlmEndpointParamsOpenAi)

    private enum DiscriminatorCodingKey: String, CodingKey {
        case type
    }

    public init(from decoder: Decoder) throws {
        if let container = try? decoder.container(keyedBy: DiscriminatorCodingKey.self) {
            if let discriminator_0 = try? container.decode(String.self, forKey: .type) {
                switch discriminator_0 {
                case "google_params":
                    if let content = try? AiLlmEndpointParamsGoogle(from: decoder) {
                        self = .aiLlmEndpointParamsGoogle(content)
                        return
                    }

                case "openai_params":
                    if let content = try? AiLlmEndpointParamsOpenAi(from: decoder) {
                        self = .aiLlmEndpointParamsOpenAi(content)
                        return
                    }

                default:
                    throw DecodingError.typeMismatch(AiLlmEndpointParamsGoogleOrAiLlmEndpointParamsOpenAi.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The Decoded object contains an unexpected value for key type"))

                }
            }

        }

        throw DecodingError.typeMismatch(AiLlmEndpointParamsGoogleOrAiLlmEndpointParamsOpenAi.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The type of the decoded object cannot be determined."))

    }

    public func encode(to encoder: Encoder) throws {
        switch self {
        case .aiLlmEndpointParamsGoogle(let aiLlmEndpointParamsGoogle):
            try aiLlmEndpointParamsGoogle.encode(to: encoder)
        case .aiLlmEndpointParamsOpenAi(let aiLlmEndpointParamsOpenAi):
            try aiLlmEndpointParamsOpenAi.encode(to: encoder)
        }
    }

}
