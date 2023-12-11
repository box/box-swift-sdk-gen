import Foundation

public class CreateFileMetadataGlobalBoxSkillsCardRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case cards
    }

    /// A list of Box Skill cards to apply to this file.
    public let cards: [KeywordSkillCardOrStatusSkillCardOrTimelineSkillCardOrTranscriptSkillCard]

    /// Initializer for a CreateFileMetadataGlobalBoxSkillsCardRequestBodyArg.
    ///
    /// - Parameters:
    ///   - cards: A list of Box Skill cards to apply to this file.
    public init(cards: [KeywordSkillCardOrStatusSkillCardOrTimelineSkillCardOrTranscriptSkillCard]) {
        self.cards = cards
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        cards = try container.decode([KeywordSkillCardOrStatusSkillCardOrTimelineSkillCardOrTranscriptSkillCard].self, forKey: .cards)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(cards, forKey: .cards)
    }

}
