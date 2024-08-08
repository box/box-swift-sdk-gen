import Foundation

/// AI ask response
public class AiAskResponse: Codable {
    private enum CodingKeys: String, CodingKey {
        case answer
        case createdAt = "created_at"
        case completionReason = "completion_reason"
        case citations
    }

    /// The answer provided by the LLM.
    public let answer: String

    /// The ISO date formatted timestamp of when the answer to the prompt was created.
    public let createdAt: Date

    /// The reason the response finishes.
    public let completionReason: String?

    /// The citations of the LLM's answer reference.
    public let citations: [AiCitation]?

    /// Initializer for a AiAskResponse.
    ///
    /// - Parameters:
    ///   - answer: The answer provided by the LLM.
    ///   - createdAt: The ISO date formatted timestamp of when the answer to the prompt was created.
    ///   - completionReason: The reason the response finishes.
    ///   - citations: The citations of the LLM's answer reference.
    public init(answer: String, createdAt: Date, completionReason: String? = nil, citations: [AiCitation]? = nil) {
        self.answer = answer
        self.createdAt = createdAt
        self.completionReason = completionReason
        self.citations = citations
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        answer = try container.decode(String.self, forKey: .answer)
        createdAt = try Utils.Dates.dateTimeFromString(dateTime: try container.decode(String.self, forKey: .createdAt))
        completionReason = try container.decodeIfPresent(String.self, forKey: .completionReason)
        citations = try container.decodeIfPresent([AiCitation].self, forKey: .citations)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(answer, forKey: .answer)
        try container.encode(Utils.Dates.dateTimeToString(dateTime: createdAt), forKey: .createdAt)
        try container.encodeIfPresent(completionReason, forKey: .completionReason)
        try container.encodeIfPresent(citations, forKey: .citations)
    }

}
