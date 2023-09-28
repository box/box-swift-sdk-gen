import Foundation

public class CreateShieldInformationBarrierSegmentRestrictionRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case shieldInformationBarrier = "shield_information_barrier"
        case shieldInformationBarrierSegment = "shield_information_barrier_segment"
        case restrictedSegment = "restricted_segment"
    }

    /// The type of the shield barrier segment
    /// restriction for this member.,
    public let type: CreateShieldInformationBarrierSegmentRestrictionRequestBodyArgTypeField
    public let shieldInformationBarrier: ShieldInformationBarrierBase?
    /// The `type` and `id` of the requested
    /// shield information barrier segment.,
    public let shieldInformationBarrierSegment: CreateShieldInformationBarrierSegmentRestrictionRequestBodyArgShieldInformationBarrierSegmentField
    /// The `type` and `id` of the restricted
    /// shield information barrier segment.,
    public let restrictedSegment: CreateShieldInformationBarrierSegmentRestrictionRequestBodyArgRestrictedSegmentField

    /// Initializer for a CreateShieldInformationBarrierSegmentRestrictionRequestBodyArg.
    ///
    /// - Parameters:
    ///   - type: The type of the shield barrier segment
    ///     restriction for this member.
    ///   - shieldInformationBarrier: ShieldInformationBarrierBase?
    ///   - shieldInformationBarrierSegment: The `type` and `id` of the requested
    ///     shield information barrier segment.
    ///   - restrictedSegment: The `type` and `id` of the restricted
    ///     shield information barrier segment.
    public init(type: CreateShieldInformationBarrierSegmentRestrictionRequestBodyArgTypeField, shieldInformationBarrier: ShieldInformationBarrierBase? = nil, shieldInformationBarrierSegment: CreateShieldInformationBarrierSegmentRestrictionRequestBodyArgShieldInformationBarrierSegmentField, restrictedSegment: CreateShieldInformationBarrierSegmentRestrictionRequestBodyArgRestrictedSegmentField) {
        self.type = type
        self.shieldInformationBarrier = shieldInformationBarrier
        self.shieldInformationBarrierSegment = shieldInformationBarrierSegment
        self.restrictedSegment = restrictedSegment
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(CreateShieldInformationBarrierSegmentRestrictionRequestBodyArgTypeField.self, forKey: .type)
        shieldInformationBarrier = try container.decodeIfPresent(ShieldInformationBarrierBase.self, forKey: .shieldInformationBarrier)
        shieldInformationBarrierSegment = try container.decode(CreateShieldInformationBarrierSegmentRestrictionRequestBodyArgShieldInformationBarrierSegmentField.self, forKey: .shieldInformationBarrierSegment)
        restrictedSegment = try container.decode(CreateShieldInformationBarrierSegmentRestrictionRequestBodyArgRestrictedSegmentField.self, forKey: .restrictedSegment)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(shieldInformationBarrier, forKey: .shieldInformationBarrier)
        try container.encode(shieldInformationBarrierSegment, forKey: .shieldInformationBarrierSegment)
        try container.encode(restrictedSegment, forKey: .restrictedSegment)
    }
}
