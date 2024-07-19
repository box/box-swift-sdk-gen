import Foundation

/// The AI agent used for generating text.
public class AiAgentTextGenResponse: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case basicGen = "basic_gen"
    }

    /// The type of AI agent used for generating text.
    public let type: AiAgentTextGenResponseTypeField?

    public let basicGen: AiAgentBasicGenTool?

    /// Initializer for a AiAgentTextGenResponse.
    ///
    /// - Parameters:
    ///   - type: The type of AI agent used for generating text.
    ///   - basicGen: 
    public init(type: AiAgentTextGenResponseTypeField? = nil, basicGen: AiAgentBasicGenTool? = nil) {
        self.type = type
        self.basicGen = basicGen
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(AiAgentTextGenResponseTypeField.self, forKey: .type)
        basicGen = try container.decodeIfPresent(AiAgentBasicGenTool.self, forKey: .basicGen)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(basicGen, forKey: .basicGen)
    }

}
