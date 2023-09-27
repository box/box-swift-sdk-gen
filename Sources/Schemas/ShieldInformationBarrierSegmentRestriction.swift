import Foundation

public class ShieldInformationBarrierSegmentRestriction: ShieldInformationBarrierSegmentRestrictionMini {
    private enum CodingKeys: String, CodingKey {
        case shieldInformationBarrier = "shield_information_barrier"
        case createdAt = "created_at"
        case createdBy = "created_by"
        case updatedAt = "updated_at"
        case updatedBy = "updated_by"
    }

    public let shieldInformationBarrier: ShieldInformationBarrierBase?
    /// ISO date time string when this
    /// shield information barrier
    /// Segment Restriction object was created.,
    public let createdAt: String?
    public let createdBy: UserBase?
    /// ISO date time string when this
    /// shield information barrier segment
    /// Restriction was updated.,
    public let updatedAt: String?
    public let updatedBy: UserBase?

    /// Initializer for a ShieldInformationBarrierSegmentRestriction.
    ///
    /// - Parameters:
    ///   - type: Shield information barrier segment restriction
    ///   - id: The unique identifier for the
    ///     shield information barrier segment restriction.
    ///   - shieldInformationBarrierSegment: The `type` and `id` of the
    ///     requested shield information barrier segment.
    ///   - restrictedSegment: The `type` and `id` of the
    ///     restricted shield information barrier segment.
    ///   - shieldInformationBarrier: ShieldInformationBarrierBase?
    ///   - createdAt: ISO date time string when this
    ///     shield information barrier
    ///     Segment Restriction object was created.
    ///   - createdBy: UserBase?
    ///   - updatedAt: ISO date time string when this
    ///     shield information barrier segment
    ///     Restriction was updated.
    ///   - updatedBy: UserBase?
    public init(type: ShieldInformationBarrierSegmentRestrictionBaseTypeField? = nil, id: String? = nil, shieldInformationBarrierSegment: ShieldInformationBarrierSegmentRestrictionMiniShieldInformationBarrierSegmentField, restrictedSegment: ShieldInformationBarrierSegmentRestrictionMiniRestrictedSegmentField, shieldInformationBarrier: ShieldInformationBarrierBase? = nil, createdAt: String? = nil, createdBy: UserBase? = nil, updatedAt: String? = nil, updatedBy: UserBase? = nil) {
        self.shieldInformationBarrier = shieldInformationBarrier
        self.createdAt = createdAt
        self.createdBy = createdBy
        self.updatedAt = updatedAt
        self.updatedBy = updatedBy
        super.init(type: type, id: id, shieldInformationBarrierSegment: shieldInformationBarrierSegment, restrictedSegment: restrictedSegment)
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        shieldInformationBarrier = try container.decodeIfPresent(ShieldInformationBarrierBase.self, forKey: .shieldInformationBarrier)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        createdBy = try container.decodeIfPresent(UserBase.self, forKey: .createdBy)
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt)
        updatedBy = try container.decodeIfPresent(UserBase.self, forKey: .updatedBy)
        try super.init(from:decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(shieldInformationBarrier, forKey: .shieldInformationBarrier)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(createdBy, forKey: .createdBy)
        try container.encodeIfPresent(updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(updatedBy, forKey: .updatedBy)
        try super.encode(to: encoder)
    }
}
