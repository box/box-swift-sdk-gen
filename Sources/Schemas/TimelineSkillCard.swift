import Foundation

public class TimelineSkillCard: Codable {
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
    public let type: TimelineSkillCardTypeField
    /// `timeline`,
    public let skillCardType: TimelineSkillCardSkillCardTypeField
    /// The title of the card.,
    public let skillCardTitle: TimelineSkillCardSkillCardTitleField?
    /// The service that applied this metadata.,
    public let skill: TimelineSkillCardSkillField
    /// The invocation of this service, used to track
    /// which instance of a service applied the metadata.,
    public let invocation: TimelineSkillCardInvocationField
    /// An total duration in seconds of the timeline.,
    public let duration: Int?
    /// A list of entries on the timeline.,
    public let entries: [TimelineSkillCardEntriesField]

    /// Initializer for a TimelineSkillCard.
    ///
    /// - Parameters:
    ///   - createdAt: The optional date and time this card was created at.
    ///   - type: `skill_card`
    ///   - skillCardType: `timeline`
    ///   - skillCardTitle: The title of the card.
    ///   - skill: The service that applied this metadata.
    ///   - invocation: The invocation of this service, used to track
    ///     which instance of a service applied the metadata.
    ///   - duration: An total duration in seconds of the timeline.
    ///   - entries: A list of entries on the timeline.
    public init(createdAt: String? = nil, type: TimelineSkillCardTypeField, skillCardType: TimelineSkillCardSkillCardTypeField, skillCardTitle: TimelineSkillCardSkillCardTitleField? = nil, skill: TimelineSkillCardSkillField, invocation: TimelineSkillCardInvocationField, duration: Int? = nil, entries: [TimelineSkillCardEntriesField]) {
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
        type = try container.decode(TimelineSkillCardTypeField.self, forKey: .type)
        skillCardType = try container.decode(TimelineSkillCardSkillCardTypeField.self, forKey: .skillCardType)
        skillCardTitle = try container.decodeIfPresent(TimelineSkillCardSkillCardTitleField.self, forKey: .skillCardTitle)
        skill = try container.decode(TimelineSkillCardSkillField.self, forKey: .skill)
        invocation = try container.decode(TimelineSkillCardInvocationField.self, forKey: .invocation)
        duration = try container.decodeIfPresent(Int.self, forKey: .duration)
        entries = try container.decode([TimelineSkillCardEntriesField].self, forKey: .entries)
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
