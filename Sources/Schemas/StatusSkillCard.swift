import Foundation

/// A Box Skill metadata card that puts a status message in the metadata sidebar.
public class StatusSkillCard: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case skillCardType = "skill_card_type"
        case status
        case skill
        case invocation
        case createdAt = "created_at"
        case skillCardTitle = "skill_card_title"
    }

    /// `skill_card`
    public let type: StatusSkillCardTypeField

    /// `status`
    public let skillCardType: StatusSkillCardSkillCardTypeField

    /// Sets the status of the skill. This can be used to show a message to the user while the Skill is processing the data, or if it was not able to process the file.
    public let status: StatusSkillCardStatusField

    /// The service that applied this metadata.
    public let skill: StatusSkillCardSkillField

    /// The invocation of this service, used to track
    /// which instance of a service applied the metadata.
    public let invocation: StatusSkillCardInvocationField

    /// The optional date and time this card was created at.
    public let createdAt: String?

    /// The title of the card.
    public let skillCardTitle: StatusSkillCardSkillCardTitleField?

    /// Initializer for a StatusSkillCard.
    ///
    /// - Parameters:
    ///   - type: `skill_card`
    ///   - skillCardType: `status`
    ///   - status: Sets the status of the skill. This can be used to show a message to the user while the Skill is processing the data, or if it was not able to process the file.
    ///   - skill: The service that applied this metadata.
    ///   - invocation: The invocation of this service, used to track
    ///     which instance of a service applied the metadata.
    ///   - createdAt: The optional date and time this card was created at.
    ///   - skillCardTitle: The title of the card.
    public init(type: StatusSkillCardTypeField, skillCardType: StatusSkillCardSkillCardTypeField, status: StatusSkillCardStatusField, skill: StatusSkillCardSkillField, invocation: StatusSkillCardInvocationField, createdAt: String? = nil, skillCardTitle: StatusSkillCardSkillCardTitleField? = nil) {
        self.type = type
        self.skillCardType = skillCardType
        self.status = status
        self.skill = skill
        self.invocation = invocation
        self.createdAt = createdAt
        self.skillCardTitle = skillCardTitle
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(StatusSkillCardTypeField.self, forKey: .type)
        skillCardType = try container.decode(StatusSkillCardSkillCardTypeField.self, forKey: .skillCardType)
        status = try container.decode(StatusSkillCardStatusField.self, forKey: .status)
        skill = try container.decode(StatusSkillCardSkillField.self, forKey: .skill)
        invocation = try container.decode(StatusSkillCardInvocationField.self, forKey: .invocation)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        skillCardTitle = try container.decodeIfPresent(StatusSkillCardSkillCardTitleField.self, forKey: .skillCardTitle)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(skillCardType, forKey: .skillCardType)
        try container.encode(status, forKey: .status)
        try container.encode(skill, forKey: .skill)
        try container.encode(invocation, forKey: .invocation)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(skillCardTitle, forKey: .skillCardTitle)
    }

}
