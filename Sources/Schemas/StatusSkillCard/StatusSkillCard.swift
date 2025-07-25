import Foundation

/// A Box Skill metadata card that puts a status message in the metadata sidebar.
public class StatusSkillCard: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case status
        case skill
        case invocation
        case createdAt = "created_at"
        case type
        case skillCardType = "skill_card_type"
        case skillCardTitle = "skill_card_title"
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// Sets the status of the skill. This can be used to show a message to the user while the Skill is processing the data, or if it was not able to process the file.
    public let status: StatusSkillCardStatusField

    /// The service that applied this metadata.
    public let skill: StatusSkillCardSkillField

    /// The invocation of this service, used to track
    /// which instance of a service applied the metadata.
    public let invocation: StatusSkillCardInvocationField

    /// The optional date and time this card was created at.
    public let createdAt: Date?

    /// The value will always be `skill_card`.
    public let type: StatusSkillCardTypeField

    /// The value will always be `status`.
    public let skillCardType: StatusSkillCardSkillCardTypeField

    /// The title of the card.
    public let skillCardTitle: StatusSkillCardSkillCardTitleField?

    /// Initializer for a StatusSkillCard.
    ///
    /// - Parameters:
    ///   - status: Sets the status of the skill. This can be used to show a message to the user while the Skill is processing the data, or if it was not able to process the file.
    ///   - skill: The service that applied this metadata.
    ///   - invocation: The invocation of this service, used to track
    ///     which instance of a service applied the metadata.
    ///   - createdAt: The optional date and time this card was created at.
    ///   - type: The value will always be `skill_card`.
    ///   - skillCardType: The value will always be `status`.
    ///   - skillCardTitle: The title of the card.
    public init(status: StatusSkillCardStatusField, skill: StatusSkillCardSkillField, invocation: StatusSkillCardInvocationField, createdAt: Date? = nil, type: StatusSkillCardTypeField = StatusSkillCardTypeField.skillCard, skillCardType: StatusSkillCardSkillCardTypeField = StatusSkillCardSkillCardTypeField.status, skillCardTitle: StatusSkillCardSkillCardTitleField? = nil) {
        self.status = status
        self.skill = skill
        self.invocation = invocation
        self.createdAt = createdAt
        self.type = type
        self.skillCardType = skillCardType
        self.skillCardTitle = skillCardTitle
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(StatusSkillCardStatusField.self, forKey: .status)
        skill = try container.decode(StatusSkillCardSkillField.self, forKey: .skill)
        invocation = try container.decode(StatusSkillCardInvocationField.self, forKey: .invocation)
        createdAt = try container.decodeDateTimeIfPresent(forKey: .createdAt)
        type = try container.decode(StatusSkillCardTypeField.self, forKey: .type)
        skillCardType = try container.decode(StatusSkillCardSkillCardTypeField.self, forKey: .skillCardType)
        skillCardTitle = try container.decodeIfPresent(StatusSkillCardSkillCardTitleField.self, forKey: .skillCardTitle)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(status, forKey: .status)
        try container.encode(skill, forKey: .skill)
        try container.encode(invocation, forKey: .invocation)
        try container.encodeDateTimeIfPresent(field: createdAt, forKey: .createdAt)
        try container.encode(type, forKey: .type)
        try container.encode(skillCardType, forKey: .skillCardType)
        try container.encodeIfPresent(skillCardTitle, forKey: .skillCardTitle)
    }

    /// Sets the raw JSON data.
    ///
    /// - Parameters:
    ///   - rawData: A dictionary containing the raw JSON data
    func setRawData(rawData: [String: Any]?) {
        self._rawData = rawData
    }

    /// Gets the raw JSON data
    /// - Returns: The `[String: Any]?`.
    func getRawData() -> [String: Any]? {
        return self._rawData
    }

}
