import Foundation

public class CreateCollaborationWhitelistExemptTargetRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case user
    }

    /// The user to exempt.
    public let user: CreateCollaborationWhitelistExemptTargetRequestBodyArgUserField

    /// Initializer for a CreateCollaborationWhitelistExemptTargetRequestBodyArg.
    ///
    /// - Parameters:
    ///   - user: The user to exempt.
    public init(user: CreateCollaborationWhitelistExemptTargetRequestBodyArgUserField) {
        self.user = user
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        user = try container.decode(CreateCollaborationWhitelistExemptTargetRequestBodyArgUserField.self, forKey: .user)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(user, forKey: .user)
    }
}
