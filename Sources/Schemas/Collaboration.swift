import Foundation

public class Collaboration: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case item
        case accessibleBy = "accessible_by"
        case inviteEmail = "invite_email"
        case role
        case expiresAt = "expires_at"
        case status
        case acknowledgedAt = "acknowledged_at"
        case createdBy = "created_by"
        case createdAt = "created_at"
        case modifiedAt = "modified_at"
        case acceptanceRequirementsStatus = "acceptance_requirements_status"
    }

    /// The unique identifier for this collaboration.,
    public let id: String?
    /// `collaboration`,
    public let type: CollaborationTypeField?
    public let item: FileOrFolderOrWebLink?
    public let accessibleBy: GroupMiniOrUserCollaborations?
    /// The email address used to invite an unregistered collaborator, if
    /// they are not a registered user.,
    public let inviteEmail: String?
    /// The level of access granted.,
    public let role: CollaborationRoleField?
    /// When the collaboration will expire, or `null` if no expiration
    /// date is set.,
    public let expiresAt: String?
    /// The status of the collaboration invitation. If the status
    /// is `pending`, `login` and `name` return an empty string.,
    public let status: CollaborationStatusField?
    /// When the `status` of the collaboration object changed to
    /// `accepted` or `rejected`.,
    public let acknowledgedAt: String?
    public let createdBy: UserCollaborations?
    /// When the collaboration object was created.,
    public let createdAt: String?
    /// When the collaboration object was last modified.,
    public let modifiedAt: String?
    public let acceptanceRequirementsStatus: CollaborationAcceptanceRequirementsStatusField?

    /// Initializer for a Collaboration.
    ///
    /// - Parameters:
    ///   - id: The unique identifier for this collaboration.
    ///   - type: `collaboration`
    ///   - item: FileOrFolderOrWebLink?
    ///   - accessibleBy: GroupMiniOrUserCollaborations?
    ///   - inviteEmail: The email address used to invite an unregistered collaborator, if
    ///     they are not a registered user.
    ///   - role: The level of access granted.
    ///   - expiresAt: When the collaboration will expire, or `null` if no expiration
    ///     date is set.
    ///   - status: The status of the collaboration invitation. If the status
    ///     is `pending`, `login` and `name` return an empty string.
    ///   - acknowledgedAt: When the `status` of the collaboration object changed to
    ///     `accepted` or `rejected`.
    ///   - createdBy: UserCollaborations?
    ///   - createdAt: When the collaboration object was created.
    ///   - modifiedAt: When the collaboration object was last modified.
    ///   - acceptanceRequirementsStatus: CollaborationAcceptanceRequirementsStatusField?
    public init(id: String? = nil, type: CollaborationTypeField? = nil, item: FileOrFolderOrWebLink? = nil, accessibleBy: GroupMiniOrUserCollaborations? = nil, inviteEmail: String? = nil, role: CollaborationRoleField? = nil, expiresAt: String? = nil, status: CollaborationStatusField? = nil, acknowledgedAt: String? = nil, createdBy: UserCollaborations? = nil, createdAt: String? = nil, modifiedAt: String? = nil, acceptanceRequirementsStatus: CollaborationAcceptanceRequirementsStatusField? = nil) {
        self.id = id
        self.type = type
        self.item = item
        self.accessibleBy = accessibleBy
        self.inviteEmail = inviteEmail
        self.role = role
        self.expiresAt = expiresAt
        self.status = status
        self.acknowledgedAt = acknowledgedAt
        self.createdBy = createdBy
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.acceptanceRequirementsStatus = acceptanceRequirementsStatus
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        type = try container.decodeIfPresent(CollaborationTypeField.self, forKey: .type)
        item = try container.decodeIfPresent(FileOrFolderOrWebLink.self, forKey: .item)
        accessibleBy = try container.decodeIfPresent(GroupMiniOrUserCollaborations.self, forKey: .accessibleBy)
        inviteEmail = try container.decodeIfPresent(String.self, forKey: .inviteEmail)
        role = try container.decodeIfPresent(CollaborationRoleField.self, forKey: .role)
        expiresAt = try container.decodeIfPresent(String.self, forKey: .expiresAt)
        status = try container.decodeIfPresent(CollaborationStatusField.self, forKey: .status)
        acknowledgedAt = try container.decodeIfPresent(String.self, forKey: .acknowledgedAt)
        createdBy = try container.decodeIfPresent(UserCollaborations.self, forKey: .createdBy)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        modifiedAt = try container.decodeIfPresent(String.self, forKey: .modifiedAt)
        acceptanceRequirementsStatus = try container.decodeIfPresent(CollaborationAcceptanceRequirementsStatusField.self, forKey: .acceptanceRequirementsStatus)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(item, forKey: .item)
        try container.encodeIfPresent(accessibleBy, forKey: .accessibleBy)
        try container.encodeIfPresent(inviteEmail, forKey: .inviteEmail)
        try container.encodeIfPresent(role, forKey: .role)
        try container.encodeIfPresent(expiresAt, forKey: .expiresAt)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(acknowledgedAt, forKey: .acknowledgedAt)
        try container.encodeIfPresent(createdBy, forKey: .createdBy)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(modifiedAt, forKey: .modifiedAt)
        try container.encodeIfPresent(acceptanceRequirementsStatus, forKey: .acceptanceRequirementsStatus)
    }
}
