import Foundation

public class ShieldInformationBarrierSegment: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case shieldInformationBarrier = "shield_information_barrier"
        case name
        case description
        case createdAt = "created_at"
        case createdBy = "created_by"
        case updatedAt = "updated_at"
        case updatedBy = "updated_by"
    }

    /// The unique identifier for the shield information barrier segment,
    public let id: String?
    /// The type of the shield information barrier segment,
    public let type: ShieldInformationBarrierSegmentTypeField?
    public let shieldInformationBarrier: ShieldInformationBarrierBase?
    /// Name of the shield information barrier segment,
    public let name: String?
    /// Description of the shield information barrier segment,
    public let description: String?
    /// ISO date time string when this shield information
    /// barrier object was created.,
    public let createdAt: String?
    public let createdBy: UserBase?
    /// ISO date time string when this
    /// shield information barrier segment was updated.,
    public let updatedAt: String?
    public let updatedBy: UserBase?

    /// Initializer for a ShieldInformationBarrierSegment.
    ///
    /// - Parameters:
    ///   - id: The unique identifier for the shield information barrier segment
    ///   - type: The type of the shield information barrier segment
    ///   - shieldInformationBarrier: ShieldInformationBarrierBase?
    ///   - name: Name of the shield information barrier segment
    ///   - description: Description of the shield information barrier segment
    ///   - createdAt: ISO date time string when this shield information
    ///     barrier object was created.
    ///   - createdBy: UserBase?
    ///   - updatedAt: ISO date time string when this
    ///     shield information barrier segment was updated.
    ///   - updatedBy: UserBase?
    public init(id: String? = nil, type: ShieldInformationBarrierSegmentTypeField? = nil, shieldInformationBarrier: ShieldInformationBarrierBase? = nil, name: String? = nil, description: String? = nil, createdAt: String? = nil, createdBy: UserBase? = nil, updatedAt: String? = nil, updatedBy: UserBase? = nil) {
        self.id = id
        self.type = type
        self.shieldInformationBarrier = shieldInformationBarrier
        self.name = name
        self.description = description
        self.createdAt = createdAt
        self.createdBy = createdBy
        self.updatedAt = updatedAt
        self.updatedBy = updatedBy
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        type = try container.decodeIfPresent(ShieldInformationBarrierSegmentTypeField.self, forKey: .type)
        shieldInformationBarrier = try container.decodeIfPresent(ShieldInformationBarrierBase.self, forKey: .shieldInformationBarrier)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        createdBy = try container.decodeIfPresent(UserBase.self, forKey: .createdBy)
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt)
        updatedBy = try container.decodeIfPresent(UserBase.self, forKey: .updatedBy)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(shieldInformationBarrier, forKey: .shieldInformationBarrier)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(createdBy, forKey: .createdBy)
        try container.encodeIfPresent(updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(updatedBy, forKey: .updatedBy)
    }
}
