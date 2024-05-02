import Foundation

/// AI response
public class AiResponse: Codable {
    private enum CodingKeys: String, CodingKey {
        case answer
        case createdAt = "created_at"
        case completionReason = "completion_reason"
    }

    /// The answer provided by the LLM.
    public let answer: String

    /// The ISO date formatted timestamp of when the answer to the prompt was created.
    public let createdAt: String

    /// The reason the response finishes.
    public let completionReason: String?

    /// Initializer for a AiResponse.
    ///
    /// - Parameters:
    ///   - answer: The answer provided by the LLM.
    ///   - createdAt: The ISO date formatted timestamp of when the answer to the prompt was created.
    ///   - completionReason: The reason the response finishes.
    public init(answer: String, createdAt: String, completionReason: String? = nil) {
        self.answer = answer
        self.createdAt = createdAt
        self.completionReason = completionReason
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        answer = try container.decode(String.self, forKey: .answer)
        createdAt = try container.decode(String.self, forKey: .createdAt)
        completionReason = try container.decodeIfPresent(String.self, forKey: .completionReason)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(answer, forKey: .answer)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(completionReason, forKey: .completionReason)
    }

}
