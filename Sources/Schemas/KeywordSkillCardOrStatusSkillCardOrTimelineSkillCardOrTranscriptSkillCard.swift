import Foundation

public enum KeywordSkillCardOrStatusSkillCardOrTimelineSkillCardOrTranscriptSkillCard: Codable {
    case keywordSkillCard(KeywordSkillCard)
    case statusSkillCard(StatusSkillCard)
    case timelineSkillCard(TimelineSkillCard)
    case transcriptSkillCard(TranscriptSkillCard)

    private enum DeterminerCodingKey: String, CodingKey {
        case skillCardType = "skill_card_type"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DeterminerCodingKey.self)
        if let skillCardType = try? container.decode(String.self, forKey: .skillCardType) {
            switch skillCardType {
            case "keyword":
                if let content = try? KeywordSkillCard(from: decoder) {
                    self = .keywordSkillCard(content)
                    return
                }

            case "status":
                if let content = try? StatusSkillCard(from: decoder) {
                    self = .statusSkillCard(content)
                    return
                }

            case "timeline":
                if let content = try? TimelineSkillCard(from: decoder) {
                    self = .timelineSkillCard(content)
                    return
                }

            case "transcript":
                if let content = try? TranscriptSkillCard(from: decoder) {
                    self = .transcriptSkillCard(content)
                    return
                }

            default:
                throw DecodingError.typeMismatch(KeywordSkillCardOrStatusSkillCardOrTimelineSkillCardOrTranscriptSkillCard.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The Decoded object contains an unexpeted value for key skill_card_type"))

            }
        }

        throw DecodingError.keyNotFound(DeterminerCodingKey.skillCardType, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The Decoded object doesn't contain entry with skill_card_type key"))
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
        case .keywordSkillCard(let keywordSkillCard):
            try keywordSkillCard.encode(to: encoder)
        case .statusSkillCard(let statusSkillCard):
            try statusSkillCard.encode(to: encoder)
        case .timelineSkillCard(let timelineSkillCard):
            try timelineSkillCard.encode(to: encoder)
        case .transcriptSkillCard(let transcriptSkillCard):
            try transcriptSkillCard.encode(to: encoder)
        }
    }

}
