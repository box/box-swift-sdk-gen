import Foundation

public class CreateShieldInformationBarrierSegmentMemberRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case shieldInformationBarrier = "shield_information_barrier"
        case shieldInformationBarrierSegment = "shield_information_barrier_segment"
        case user
    }

    /// -| A type of the shield barrier segment member.,
    public let type: CreateShieldInformationBarrierSegmentMemberRequestBodyArgTypeField?
    public let shieldInformationBarrier: ShieldInformationBarrierBase?
    /// The `type` and `id` of the
    /// requested shield information barrier segment.,
    public let shieldInformationBarrierSegment: CreateShieldInformationBarrierSegmentMemberRequestBodyArgShieldInformationBarrierSegmentField
    public let user: UserBase

    /// Initializer for a CreateShieldInformationBarrierSegmentMemberRequestBodyArg.
    ///
    /// - Parameters:
    ///   - type: -| A type of the shield barrier segment member.
    ///   - shieldInformationBarrier: ShieldInformationBarrierBase?
    ///   - shieldInformationBarrierSegment: The `type` and `id` of the
    ///     requested shield information barrier segment.
    ///   - user: UserBase
    public init(type: CreateShieldInformationBarrierSegmentMemberRequestBodyArgTypeField? = nil, shieldInformationBarrier: ShieldInformationBarrierBase? = nil, shieldInformationBarrierSegment: CreateShieldInformationBarrierSegmentMemberRequestBodyArgShieldInformationBarrierSegmentField, user: UserBase) {
        self.type = type
        self.shieldInformationBarrier = shieldInformationBarrier
        self.shieldInformationBarrierSegment = shieldInformationBarrierSegment
        self.user = user
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(CreateShieldInformationBarrierSegmentMemberRequestBodyArgTypeField.self, forKey: .type)
        shieldInformationBarrier = try container.decodeIfPresent(ShieldInformationBarrierBase.self, forKey: .shieldInformationBarrier)
        shieldInformationBarrierSegment = try container.decode(CreateShieldInformationBarrierSegmentMemberRequestBodyArgShieldInformationBarrierSegmentField.self, forKey: .shieldInformationBarrierSegment)
        user = try container.decode(UserBase.self, forKey: .user)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(shieldInformationBarrier, forKey: .shieldInformationBarrier)
        try container.encode(shieldInformationBarrierSegment, forKey: .shieldInformationBarrierSegment)
        try container.encode(user, forKey: .user)
    }
}
