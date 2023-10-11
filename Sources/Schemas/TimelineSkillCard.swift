import Foundation

/// A Box Skill metadata card that places a list of images on a
/// timeline.
public class TimelineSkillCard: Codable {
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
    public let type: TimelineSkillCardTypeField
    /// `timeline`
    public let skillCardType: TimelineSkillCardSkillCardTypeField
    /// The service that applied this metadata.
    public let skill: TimelineSkillCardSkillField
    /// The invocation of this service, used to track
    /// which instance of a service applied the metadata.
    public let invocation: TimelineSkillCardInvocationField
    /// A list of entries on the timeline.
    public let entries: [TimelineSkillCardEntriesField]
    /// The optional date and time this card was created at.
    public let createdAt: String?
    /// The title of the card.
    public let skillCardTitle: TimelineSkillCardSkillCardTitleField?
    /// An total duration in seconds of the timeline.
    public let duration: Int?

    /// Initializer for a TimelineSkillCard.
    ///
    /// - Parameters:
    ///   - type: `skill_card`
    ///   - skillCardType: `timeline`
    ///   - skill: The service that applied this metadata.
    ///   - invocation: The invocation of this service, used to track
    ///     which instance of a service applied the metadata.
    ///   - entries: A list of entries on the timeline.
    ///   - createdAt: The optional date and time this card was created at.
    ///   - skillCardTitle: The title of the card.
    ///   - duration: An total duration in seconds of the timeline.
    public init(type: TimelineSkillCardTypeField, skillCardType: TimelineSkillCardSkillCardTypeField, skill: TimelineSkillCardSkillField, invocation: TimelineSkillCardInvocationField, entries: [TimelineSkillCardEntriesField], createdAt: String? = nil, skillCardTitle: TimelineSkillCardSkillCardTitleField? = nil, duration: Int? = nil) {
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
        type = try container.decode(TimelineSkillCardTypeField.self, forKey: .type)
        skillCardType = try container.decode(TimelineSkillCardSkillCardTypeField.self, forKey: .skillCardType)
        skill = try container.decode(TimelineSkillCardSkillField.self, forKey: .skill)
        invocation = try container.decode(TimelineSkillCardInvocationField.self, forKey: .invocation)
        entries = try container.decode([TimelineSkillCardEntriesField].self, forKey: .entries)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        skillCardTitle = try container.decodeIfPresent(TimelineSkillCardSkillCardTitleField.self, forKey: .skillCardTitle)
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
