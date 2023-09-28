import Foundation

public class CreateTermOfServiceUserStatusRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case tos
        case user
        case isAccepted = "is_accepted"
    }

    /// The terms of service to set the status for.,
    public let tos: CreateTermOfServiceUserStatusRequestBodyArgTosField
    /// The user to set the status for.,
    public let user: CreateTermOfServiceUserStatusRequestBodyArgUserField
    /// Whether the user has accepted the terms.,
    public let isAccepted: Bool

    /// Initializer for a CreateTermOfServiceUserStatusRequestBodyArg.
    ///
    /// - Parameters:
    ///   - tos: The terms of service to set the status for.
    ///   - user: The user to set the status for.
    ///   - isAccepted: Whether the user has accepted the terms.
    public init(tos: CreateTermOfServiceUserStatusRequestBodyArgTosField, user: CreateTermOfServiceUserStatusRequestBodyArgUserField, isAccepted: Bool) {
        self.tos = tos
        self.user = user
        self.isAccepted = isAccepted
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tos = try container.decode(CreateTermOfServiceUserStatusRequestBodyArgTosField.self, forKey: .tos)
        user = try container.decode(CreateTermOfServiceUserStatusRequestBodyArgUserField.self, forKey: .user)
        isAccepted = try container.decode(Bool.self, forKey: .isAccepted)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(tos, forKey: .tos)
        try container.encode(user, forKey: .user)
        try container.encode(isAccepted, forKey: .isAccepted)
    }
}
