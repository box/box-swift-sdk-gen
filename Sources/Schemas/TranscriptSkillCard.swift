import Foundation

/// A Box Skill metadata card that adds a transcript to a file.
public class TranscriptSkillCard: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case skillCardType = "skill_card_type"
        case skill
        case invocation
        case entries
        case createdAt = "created_at"
        case skillCardTitle = "skill_card_title"
        case duration
    }

    /// `skill_card`
    public let type: TranscriptSkillCardTypeField
    /// `transcript`
    public let skillCardType: TranscriptSkillCardSkillCardTypeField
    /// The service that applied this metadata.
    public let skill: TranscriptSkillCardSkillField
    /// The invocation of this service, used to track
    /// which instance of a service applied the metadata.
    public let invocation: TranscriptSkillCardInvocationField
    /// An list of entries for the card. This represents the individual entries of
    /// the transcription.
    public let entries: [TranscriptSkillCardEntriesField]
    /// The optional date and time this card was created at.
    public let createdAt: String?
    /// The title of the card.
    public let skillCardTitle: TranscriptSkillCardSkillCardTitleField?
    /// An optional total duration in seconds.
    /// 
    /// Used with a `skill_card_type` of `transcript` or
    /// `timeline`.
    public let duration: Int?

    /// Initializer for a TranscriptSkillCard.
    ///
    /// - Parameters:
    ///   - type: `skill_card`
    ///   - skillCardType: `transcript`
    ///   - skill: The service that applied this metadata.
    ///   - invocation: The invocation of this service, used to track
    ///     which instance of a service applied the metadata.
    ///   - entries: An list of entries for the card. This represents the individual entries of
    ///     the transcription.
    ///   - createdAt: The optional date and time this card was created at.
    ///   - skillCardTitle: The title of the card.
    ///   - duration: An optional total duration in seconds.
    ///     
    ///     Used with a `skill_card_type` of `transcript` or
    ///     `timeline`.
    public init(type: TranscriptSkillCardTypeField, skillCardType: TranscriptSkillCardSkillCardTypeField, skill: TranscriptSkillCardSkillField, invocation: TranscriptSkillCardInvocationField, entries: [TranscriptSkillCardEntriesField], createdAt: String? = nil, skillCardTitle: TranscriptSkillCardSkillCardTitleField? = nil, duration: Int? = nil) {
        self.type = type
        self.skillCardType = skillCardType
        self.skill = skill
        self.invocation = invocation
        self.entries = entries
        self.createdAt = createdAt
        self.skillCardTitle = skillCardTitle
        self.duration = duration
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(TranscriptSkillCardTypeField.self, forKey: .type)
        skillCardType = try container.decode(TranscriptSkillCardSkillCardTypeField.self, forKey: .skillCardType)
        skill = try container.decode(TranscriptSkillCardSkillField.self, forKey: .skill)
        invocation = try container.decode(TranscriptSkillCardInvocationField.self, forKey: .invocation)
        entries = try container.decode([TranscriptSkillCardEntriesField].self, forKey: .entries)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        skillCardTitle = try container.decodeIfPresent(TranscriptSkillCardSkillCardTitleField.self, forKey: .skillCardTitle)
        duration = try container.decodeIfPresent(Int.self, forKey: .duration)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(skillCardType, forKey: .skillCardType)
        try container.encode(skill, forKey: .skill)
        try container.encode(invocation, forKey: .invocation)
        try container.encode(entries, forKey: .entries)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(skillCardTitle, forKey: .skillCardTitle)
        try container.encodeIfPresent(duration, forKey: .duration)
    }
}
