import Foundation

/// A skill card that contains a set of keywords
public class KeywordSkillCard: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case skillCardType = "skill_card_type"
        case skill
        case invocation
        case entries
        case createdAt = "created_at"
        case skillCardTitle = "skill_card_title"
    }

    /// `skill_card`
    public let type: KeywordSkillCardTypeField
    /// `keyword`
    public let skillCardType: KeywordSkillCardSkillCardTypeField
    /// The service that applied this metadata.
    public let skill: KeywordSkillCardSkillField
    /// The invocation of this service, used to track
    /// which instance of a service applied the metadata.
    public let invocation: KeywordSkillCardInvocationField
    /// An list of entries in the metadata card.
    public let entries: [KeywordSkillCardEntriesField]
    /// The optional date and time this card was created at.
    public let createdAt: String?
    /// The title of the card.
    public let skillCardTitle: KeywordSkillCardSkillCardTitleField?

    /// Initializer for a KeywordSkillCard.
    ///
    /// - Parameters:
    ///   - type: `skill_card`
    ///   - skillCardType: `keyword`
    ///   - skill: The service that applied this metadata.
    ///   - invocation: The invocation of this service, used to track
    ///     which instance of a service applied the metadata.
    ///   - entries: An list of entries in the metadata card.
    ///   - createdAt: The optional date and time this card was created at.
    ///   - skillCardTitle: The title of the card.
    public init(type: KeywordSkillCardTypeField, skillCardType: KeywordSkillCardSkillCardTypeField, skill: KeywordSkillCardSkillField, invocation: KeywordSkillCardInvocationField, entries: [KeywordSkillCardEntriesField], createdAt: String? = nil, skillCardTitle: KeywordSkillCardSkillCardTitleField? = nil) {
        self.type = type
        self.skillCardType = skillCardType
        self.skill = skill
        self.invocation = invocation
        self.entries = entries
        self.createdAt = createdAt
        self.skillCardTitle = skillCardTitle
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(KeywordSkillCardTypeField.self, forKey: .type)
        skillCardType = try container.decode(KeywordSkillCardSkillCardTypeField.self, forKey: .skillCardType)
        skill = try container.decode(KeywordSkillCardSkillField.self, forKey: .skill)
        invocation = try container.decode(KeywordSkillCardInvocationField.self, forKey: .invocation)
        entries = try container.decode([KeywordSkillCardEntriesField].self, forKey: .entries)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        skillCardTitle = try container.decodeIfPresent(KeywordSkillCardSkillCardTitleField.self, forKey: .skillCardTitle)
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
    }
}
