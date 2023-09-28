import Foundation

public class StatusSkillCard: Codable {
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case type
        case skillCardType = "skill_card_type"
        case skillCardTitle = "skill_card_title"
        case status
        case skill
        case invocation
    }

    /// The optional date and time this card was created at.,
    public let createdAt: String?
    /// `skill_card`,
    public let type: StatusSkillCardTypeField
    /// `status`,
    public let skillCardType: StatusSkillCardSkillCardTypeField
    /// The title of the card.,
    public let skillCardTitle: StatusSkillCardSkillCardTitleField?
    /// Sets the status of the skill. This can be used to show a message to the user while the Skill is processing the data, or if it was not able to process the file.,
    public let status: StatusSkillCardStatusField
    /// The service that applied this metadata.,
    public let skill: StatusSkillCardSkillField
    /// The invocation of this service, used to track
    /// which instance of a service applied the metadata.,
    public let invocation: StatusSkillCardInvocationField

    /// Initializer for a StatusSkillCard.
    ///
    /// - Parameters:
    ///   - createdAt: The optional date and time this card was created at.
    ///   - type: `skill_card`
    ///   - skillCardType: `status`
    ///   - skillCardTitle: The title of the card.
    ///   - status: Sets the status of the skill. This can be used to show a message to the user while the Skill is processing the data, or if it was not able to process the file.
    ///   - skill: The service that applied this metadata.
    ///   - invocation: The invocation of this service, used to track
    ///     which instance of a service applied the metadata.
    public init(createdAt: String? = nil, type: StatusSkillCardTypeField, skillCardType: StatusSkillCardSkillCardTypeField, skillCardTitle: StatusSkillCardSkillCardTitleField? = nil, status: StatusSkillCardStatusField, skill: StatusSkillCardSkillField, invocation: StatusSkillCardInvocationField) {
        self.createdAt = createdAt
        self.type = type
        self.skillCardType = skillCardType
        self.skillCardTitle = skillCardTitle
        self.status = status
        self.skill = skill
        self.invocation = invocation
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        type = try container.decode(StatusSkillCardTypeField.self, forKey: .type)
        skillCardType = try container.decode(StatusSkillCardSkillCardTypeField.self, forKey: .skillCardType)
        skillCardTitle = try container.decodeIfPresent(StatusSkillCardSkillCardTitleField.self, forKey: .skillCardTitle)
        status = try container.decode(StatusSkillCardStatusField.self, forKey: .status)
        skill = try container.decode(StatusSkillCardSkillField.self, forKey: .skill)
        invocation = try container.decode(StatusSkillCardInvocationField.self, forKey: .invocation)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encode(type, forKey: .type)
        try container.encode(skillCardType, forKey: .skillCardType)
        try container.encodeIfPresent(skillCardTitle, forKey: .skillCardTitle)
        try container.encode(status, forKey: .status)
        try container.encode(skill, forKey: .skill)
        try container.encode(invocation, forKey: .invocation)
    }
}
