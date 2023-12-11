import Foundation

public class CreateShieldInformationBarrierSegmentRestrictionRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case shieldInformationBarrierSegment = "shield_information_barrier_segment"
        case restrictedSegment = "restricted_segment"
        case shieldInformationBarrier = "shield_information_barrier"
    }

    /// The type of the shield barrier segment
    /// restriction for this member.
    public let type: CreateShieldInformationBarrierSegmentRestrictionRequestBodyArgTypeField

    /// The `type` and `id` of the requested
    /// shield information barrier segment.
    public let shieldInformationBarrierSegment: CreateShieldInformationBarrierSegmentRestrictionRequestBodyArgShieldInformationBarrierSegmentField

    /// The `type` and `id` of the restricted
    /// shield information barrier segment.
    public let restrictedSegment: CreateShieldInformationBarrierSegmentRestrictionRequestBodyArgRestrictedSegmentField

    public let shieldInformationBarrier: ShieldInformationBarrierBase?

    /// Initializer for a CreateShieldInformationBarrierSegmentRestrictionRequestBodyArg.
    ///
    /// - Parameters:
    ///   - type: The type of the shield barrier segment
    ///     restriction for this member.
    ///   - shieldInformationBarrierSegment: The `type` and `id` of the requested
    ///     shield information barrier segment.
    ///   - restrictedSegment: The `type` and `id` of the restricted
    ///     shield information barrier segment.
    ///   - shieldInformationBarrier: 
    public init(type: CreateShieldInformationBarrierSegmentRestrictionRequestBodyArgTypeField, shieldInformationBarrierSegment: CreateShieldInformationBarrierSegmentRestrictionRequestBodyArgShieldInformationBarrierSegmentField, restrictedSegment: CreateShieldInformationBarrierSegmentRestrictionRequestBodyArgRestrictedSegmentField, shieldInformationBarrier: ShieldInformationBarrierBase? = nil) {
        self.type = type
        self.shieldInformationBarrierSegment = shieldInformationBarrierSegment
        self.restrictedSegment = restrictedSegment
        self.shieldInformationBarrier = shieldInformationBarrier
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(CreateShieldInformationBarrierSegmentRestrictionRequestBodyArgTypeField.self, forKey: .type)
        shieldInformationBarrierSegment = try container.decode(CreateShieldInformationBarrierSegmentRestrictionRequestBodyArgShieldInformationBarrierSegmentField.self, forKey: .shieldInformationBarrierSegment)
        restrictedSegment = try container.decode(CreateShieldInformationBarrierSegmentRestrictionRequestBodyArgRestrictedSegmentField.self, forKey: .restrictedSegment)
        shieldInformationBarrier = try container.decodeIfPresent(ShieldInformationBarrierBase.self, forKey: .shieldInformationBarrier)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(shieldInformationBarrierSegment, forKey: .shieldInformationBarrierSegment)
        try container.encode(restrictedSegment, forKey: .restrictedSegment)
        try container.encodeIfPresent(shieldInformationBarrier, forKey: .shieldInformationBarrier)
    }

}
