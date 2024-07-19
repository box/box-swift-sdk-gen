import Foundation

public enum AiAgentAskResponseOrAiAgentTextGenResponse: Codable {
    case aiAgentAskResponse(AiAgentAskResponse)
    case aiAgentTextGenResponse(AiAgentTextGenResponse)

    private enum DiscriminatorCodingKey: String, CodingKey {
        case type
    }

    public init(from decoder: Decoder) throws {
        if let container = try? decoder.container(keyedBy: DiscriminatorCodingKey.self) {
            if let discriminator_0 = try? container.decode(String.self, forKey: .type) {
                switch discriminator_0 {
                case "ai_agent_ask":
                    if let content = try? AiAgentAskResponse(from: decoder) {
                        self = .aiAgentAskResponse(content)
                        return
                    }

                case "ai_agent_text_gen":
                    if let content = try? AiAgentTextGenResponse(from: decoder) {
                        self = .aiAgentTextGenResponse(content)
                        return
                    }

                default:
                    throw DecodingError.typeMismatch(AiAgentAskResponseOrAiAgentTextGenResponse.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The Decoded object contains an unexpected value for key type"))

                }
            }

        }

        throw DecodingError.typeMismatch(AiAgentAskResponseOrAiAgentTextGenResponse.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The type of the decoded object cannot be determined."))

    }

    public func encode(to encoder: Encoder) throws {
        switch self {
        case .aiAgentAskResponse(let aiAgentAskResponse):
            try aiAgentAskResponse.encode(to: encoder)
        case .aiAgentTextGenResponse(let aiAgentTextGenResponse):
            try aiAgentTextGenResponse.encode(to: encoder)
        }
    }

}
