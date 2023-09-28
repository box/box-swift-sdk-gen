import Foundation

public class TranscriptSkillCard: Codable {
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case type
        case skillCardType = "skill_card_type"
        case skillCardTitle = "skill_card_title"
        case skill
        case invocation
        case duration
        case entries
    }

    /// The optional date and time this card was created at.,
    public let createdAt: String?
    /// `skill_card`,
    public let type: TranscriptSkillCardTypeField
    /// `transcript`,
    public let skillCardType: TranscriptSkillCardSkillCardTypeField
    /// The title of the card.,
    public let skillCardTitle: TranscriptSkillCardSkillCardTitleField?
    /// The service that applied this metadata.,
    public let skill: TranscriptSkillCardSkillField
    /// The invocation of this service, used to track
    /// which instance of a service applied the metadata.,
    public let invocation: TranscriptSkillCardInvocationField
    /// An optional total duration in seconds.
    /// 
    /// Used with a `skill_card_type` of `transcript` or
    /// `timeline`.,
    public let duration: Int?
    /// An list of entries for the card. This represents the individual entries of
    /// the transcription.,
    public let entries: [TranscriptSkillCardEntriesField]

    /// Initializer for a TranscriptSkillCard.
    ///
    /// - Parameters:
    ///   - createdAt: The optional date and time this card was created at.
    ///   - type: `skill_card`
    ///   - skillCardType: `transcript`
    ///   - skillCardTitle: The title of the card.
    ///   - skill: The service that applied this metadata.
    ///   - invocation: The invocation of this service, used to track
    ///     which instance of a service applied the metadata.
    ///   - duration: An optional total duration in seconds.
    ///     
    ///     Used with a `skill_card_type` of `transcript` or
    ///     `timeline`.
    ///   - entries: An list of entries for the card. This represents the individual entries of
    ///     the transcription.
    public init(createdAt: String? = nil, type: TranscriptSkillCardTypeField, skillCardType: TranscriptSkillCardSkillCardTypeField, skillCardTitle: TranscriptSkillCardSkillCardTitleField? = nil, skill: TranscriptSkillCardSkillField, invocation: TranscriptSkillCardInvocationField, duration: Int? = nil, entries: [TranscriptSkillCardEntriesField]) {
        self.createdAt = createdAt
        self.type = type
        self.skillCardType = skillCardType
        self.skillCardTitle = skillCardTitle
        self.skill = skill
        self.invocation = invocation
        self.duration = duration
        self.entries = entries
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        type = try container.decode(TranscriptSkillCardTypeField.self, forKey: .type)
        skillCardType = try container.decode(TranscriptSkillCardSkillCardTypeField.self, forKey: .skillCardType)
        skillCardTitle = try container.decodeIfPresent(TranscriptSkillCardSkillCardTitleField.self, forKey: .skillCardTitle)
        skill = try container.decode(TranscriptSkillCardSkillField.self, forKey: .skill)
        invocation = try container.decode(TranscriptSkillCardInvocationField.self, forKey: .invocation)
        duration = try container.decodeIfPresent(Int.self, forKey: .duration)
        entries = try container.decode([TranscriptSkillCardEntriesField].self, forKey: .entries)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encode(type, forKey: .type)
        try container.encode(skillCardType, forKey: .skillCardType)
        try container.encodeIfPresent(skillCardTitle, forKey: .skillCardTitle)
        try container.encode(skill, forKey: .skill)
        try container.encode(invocation, forKey: .invocation)
        try container.encodeIfPresent(duration, forKey: .duration)
        try container.encode(entries, forKey: .entries)
    }
}
