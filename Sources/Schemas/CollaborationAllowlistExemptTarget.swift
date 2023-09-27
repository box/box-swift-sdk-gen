import Foundation

public class CollaborationAllowlistExemptTarget: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case enterprise
        case user
        case createdAt = "created_at"
        case modifiedAt = "modified_at"
    }

    /// The unique identifier for this exemption,
    public let id: String?
    /// `collaboration_whitelist_exempt_target`,
    public let type: CollaborationAllowlistExemptTargetTypeField?
    public let enterprise: CollaborationAllowlistExemptTargetEnterpriseField?
    public let user: UserMini?
    /// The time the entry was created,
    public let createdAt: String?
    /// The time the entry was modified,
    public let modifiedAt: String?

    /// Initializer for a CollaborationAllowlistExemptTarget.
    ///
    /// - Parameters:
    ///   - id: The unique identifier for this exemption
    ///   - type: `collaboration_whitelist_exempt_target`
    ///   - enterprise: CollaborationAllowlistExemptTargetEnterpriseField?
    ///   - user: UserMini?
    ///   - createdAt: The time the entry was created
    ///   - modifiedAt: The time the entry was modified
    public init(id: String? = nil, type: CollaborationAllowlistExemptTargetTypeField? = nil, enterprise: CollaborationAllowlistExemptTargetEnterpriseField? = nil, user: UserMini? = nil, createdAt: String? = nil, modifiedAt: String? = nil) {
        self.id = id
        self.type = type
        self.enterprise = enterprise
        self.user = user
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        type = try container.decodeIfPresent(CollaborationAllowlistExemptTargetTypeField.self, forKey: .type)
        enterprise = try container.decodeIfPresent(CollaborationAllowlistExemptTargetEnterpriseField.self, forKey: .enterprise)
        user = try container.decodeIfPresent(UserMini.self, forKey: .user)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        modifiedAt = try container.decodeIfPresent(String.self, forKey: .modifiedAt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(enterprise, forKey: .enterprise)
        try container.encodeIfPresent(user, forKey: .user)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(modifiedAt, forKey: .modifiedAt)
    }
}
