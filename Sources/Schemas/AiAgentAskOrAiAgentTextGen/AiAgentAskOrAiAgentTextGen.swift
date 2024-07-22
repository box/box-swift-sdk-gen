import Foundation

public enum AiAgentAskOrAiAgentTextGen: Codable {
    case aiAgentAsk(AiAgentAsk)
    case aiAgentTextGen(AiAgentTextGen)

    private enum DiscriminatorCodingKey: String, CodingKey {
        case type
    }

    public init(from decoder: Decoder) throws {
        if let container = try? decoder.container(keyedBy: DiscriminatorCodingKey.self) {
            if let discriminator_0 = try? container.decode(String.self, forKey: .type) {
                switch discriminator_0 {
                case "ai_agent_ask":
                    if let content = try? AiAgentAsk(from: decoder) {
                        self = .aiAgentAsk(content)
                        return
                    }

                case "ai_agent_text_gen":
                    if let content = try? AiAgentTextGen(from: decoder) {
                        self = .aiAgentTextGen(content)
                        return
                    }

                default:
                    throw DecodingError.typeMismatch(AiAgentAskOrAiAgentTextGen.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The Decoded object contains an unexpected value for key type"))

                }
            }

        }

        throw DecodingError.typeMismatch(AiAgentAskOrAiAgentTextGen.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The type of the decoded object cannot be determined."))

    }

    public func encode(to encoder: Encoder) throws {
        switch self {
        case .aiAgentAsk(let aiAgentAsk):
            try aiAgentAsk.encode(to: encoder)
        case .aiAgentTextGen(let aiAgentTextGen):
            try aiAgentTextGen.encode(to: encoder)
        }
    }

}
