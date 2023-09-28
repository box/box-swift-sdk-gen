import Foundation

public class KeywordSkillCard: Codable {
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case type
        case skillCardType = "skill_card_type"
        case skillCardTitle = "skill_card_title"
        case skill
        case invocation
        case entries
    }

    /// The optional date and time this card was created at.,
    public let createdAt: String?
    /// `skill_card`,
    public let type: KeywordSkillCardTypeField
    /// `keyword`,
    public let skillCardType: KeywordSkillCardSkillCardTypeField
    /// The title of the card.,
    public let skillCardTitle: KeywordSkillCardSkillCardTitleField?
    /// The service that applied this metadata.,
    public let skill: KeywordSkillCardSkillField
    /// The invocation of this service, used to track
    /// which instance of a service applied the metadata.,
    public let invocation: KeywordSkillCardInvocationField
    /// An list of entries in the metadata card.,
    public let entries: [KeywordSkillCardEntriesField]

    /// Initializer for a KeywordSkillCard.
    ///
    /// - Parameters:
    ///   - createdAt: The optional date and time this card was created at.
    ///   - type: `skill_card`
    ///   - skillCardType: `keyword`
    ///   - skillCardTitle: The title of the card.
    ///   - skill: The service that applied this metadata.
    ///   - invocation: The invocation of this service, used to track
    ///     which instance of a service applied the metadata.
    ///   - entries: An list of entries in the metadata card.
    public init(createdAt: String? = nil, type: KeywordSkillCardTypeField, skillCardType: KeywordSkillCardSkillCardTypeField, skillCardTitle: KeywordSkillCardSkillCardTitleField? = nil, skill: KeywordSkillCardSkillField, invocation: KeywordSkillCardInvocationField, entries: [KeywordSkillCardEntriesField]) {
        self.createdAt = createdAt
        self.type = type
        self.skillCardType = skillCardType
        self.skillCardTitle = skillCardTitle
        self.skill = skill
        self.invocation = invocation
        self.entries = entries
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        type = try container.decode(KeywordSkillCardTypeField.self, forKey: .type)
        skillCardType = try container.decode(KeywordSkillCardSkillCardTypeField.self, forKey: .skillCardType)
        skillCardTitle = try container.decodeIfPresent(KeywordSkillCardSkillCardTitleField.self, forKey: .skillCardTitle)
        skill = try container.decode(KeywordSkillCardSkillField.self, forKey: .skill)
        invocation = try container.decode(KeywordSkillCardInvocationField.self, forKey: .invocation)
        entries = try container.decode([KeywordSkillCardEntriesField].self, forKey: .entries)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encode(type, forKey: .type)
        try container.encode(skillCardType, forKey: .skillCardType)
        try container.encodeIfPresent(skillCardTitle, forKey: .skillCardTitle)
        try container.encode(skill, forKey: .skill)
        try container.encode(invocation, forKey: .invocation)
        try container.encode(entries, forKey: .entries)
    }
}
