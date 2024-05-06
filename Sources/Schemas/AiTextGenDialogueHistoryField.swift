import Foundation

public class AiTextGenDialogueHistoryField: Codable {
    private enum CodingKeys: String, CodingKey {
        case prompt
        case answer
        case createdAt = "created_at"
    }

    /// The prompt previously provided by the client and answered by the LLM.
    public let prompt: String?

    /// The answer previously provided by the LLM.
    public let answer: String?

    /// The ISO date formatted timestamp of when the previous answer to the prompt was created.
    public let createdAt: String?

    /// Initializer for a AiTextGenDialogueHistoryField.
    ///
    /// - Parameters:
    ///   - prompt: The prompt previously provided by the client and answered by the LLM.
    ///   - answer: The answer previously provided by the LLM.
    ///   - createdAt: The ISO date formatted timestamp of when the previous answer to the prompt was created.
    public init(prompt: String? = nil, answer: String? = nil, createdAt: String? = nil) {
        self.prompt = prompt
        self.answer = answer
        self.createdAt = createdAt
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        prompt = try container.decodeIfPresent(String.self, forKey: .prompt)
        answer = try container.decodeIfPresent(String.self, forKey: .answer)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(prompt, forKey: .prompt)
        try container.encodeIfPresent(answer, forKey: .answer)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
    }

}
