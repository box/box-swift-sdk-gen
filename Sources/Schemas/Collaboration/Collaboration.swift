import Foundation

/// Collaborations define access permissions for users and groups to files and
/// folders, similar to access control lists. A collaboration object grants a
/// user or group access to a file or folder with permissions defined by a
/// specific role.
public class Collaboration: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case item
        case accessibleBy = "accessible_by"
        case inviteEmail = "invite_email"
        case role
        case expiresAt = "expires_at"
        case isAccessOnly = "is_access_only"
        case status
        case acknowledgedAt = "acknowledged_at"
        case createdBy = "created_by"
        case createdAt = "created_at"
        case modifiedAt = "modified_at"
        case acceptanceRequirementsStatus = "acceptance_requirements_status"
    }

    /// The unique identifier for this collaboration.
    public let id: String

    /// `collaboration`
    public let type: CollaborationTypeField

    public let item: FileOrFolderOrWebLink?

    public let accessibleBy: GroupMiniOrUserCollaborations?

    /// The email address used to invite an unregistered collaborator, if
    /// they are not a registered user.
    public let inviteEmail: String?

    /// The level of access granted.
    public let role: CollaborationRoleField?

    /// When the collaboration will expire, or `null` if no expiration
    /// date is set.
    public let expiresAt: Date?

    /// If set to `true`, collaborators have access to
    /// shared items, but such items won't be visible in the
    /// All Files list. Additionally, collaborators won't
    /// see the the path to the root folder for the
    /// shared item.
    public let isAccessOnly: Bool?

    /// The status of the collaboration invitation. If the status
    /// is `pending`, `login` and `name` return an empty string.
    public let status: CollaborationStatusField?

    /// When the `status` of the collaboration object changed to
    /// `accepted` or `rejected`.
    public let acknowledgedAt: Date?

    public let createdBy: UserCollaborations?

    /// When the collaboration object was created.
    public let createdAt: Date?

    /// When the collaboration object was last modified.
    public let modifiedAt: Date?

    public let acceptanceRequirementsStatus: CollaborationAcceptanceRequirementsStatusField?

    /// Initializer for a Collaboration.
    ///
    /// - Parameters:
    ///   - id: The unique identifier for this collaboration.
    ///   - type: `collaboration`
    ///   - item: 
    ///   - accessibleBy: 
    ///   - inviteEmail: The email address used to invite an unregistered collaborator, if
    ///     they are not a registered user.
    ///   - role: The level of access granted.
    ///   - expiresAt: When the collaboration will expire, or `null` if no expiration
    ///     date is set.
    ///   - isAccessOnly: If set to `true`, collaborators have access to
    ///     shared items, but such items won't be visible in the
    ///     All Files list. Additionally, collaborators won't
    ///     see the the path to the root folder for the
    ///     shared item.
    ///   - status: The status of the collaboration invitation. If the status
    ///     is `pending`, `login` and `name` return an empty string.
    ///   - acknowledgedAt: When the `status` of the collaboration object changed to
    ///     `accepted` or `rejected`.
    ///   - createdBy: 
    ///   - createdAt: When the collaboration object was created.
    ///   - modifiedAt: When the collaboration object was last modified.
    ///   - acceptanceRequirementsStatus: 
    public init(id: String, type: CollaborationTypeField = CollaborationTypeField.collaboration, item: FileOrFolderOrWebLink? = nil, accessibleBy: GroupMiniOrUserCollaborations? = nil, inviteEmail: String? = nil, role: CollaborationRoleField? = nil, expiresAt: Date? = nil, isAccessOnly: Bool? = nil, status: CollaborationStatusField? = nil, acknowledgedAt: Date? = nil, createdBy: UserCollaborations? = nil, createdAt: Date? = nil, modifiedAt: Date? = nil, acceptanceRequirementsStatus: CollaborationAcceptanceRequirementsStatusField? = nil) {
        self.id = id
        self.type = type
        self.item = item
        self.accessibleBy = accessibleBy
        self.inviteEmail = inviteEmail
        self.role = role
        self.expiresAt = expiresAt
        self.isAccessOnly = isAccessOnly
        self.status = status
        self.acknowledgedAt = acknowledgedAt
        self.createdBy = createdBy
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.acceptanceRequirementsStatus = acceptanceRequirementsStatus
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        type = try container.decode(CollaborationTypeField.self, forKey: .type)
        item = try container.decodeIfPresent(FileOrFolderOrWebLink.self, forKey: .item)
        accessibleBy = try container.decodeIfPresent(GroupMiniOrUserCollaborations.self, forKey: .accessibleBy)
        inviteEmail = try container.decodeIfPresent(String.self, forKey: .inviteEmail)
        role = try container.decodeIfPresent(CollaborationRoleField.self, forKey: .role)
        if let _expiresAt = try container.decodeIfPresent(String.self, forKey: .expiresAt) {
            expiresAt = try Utils.Dates.dateTimeFromString(dateTime: _expiresAt)
        } else {
            expiresAt = nil
        }

        isAccessOnly = try container.decodeIfPresent(Bool.self, forKey: .isAccessOnly)
        status = try container.decodeIfPresent(CollaborationStatusField.self, forKey: .status)
        if let _acknowledgedAt = try container.decodeIfPresent(String.self, forKey: .acknowledgedAt) {
            acknowledgedAt = try Utils.Dates.dateTimeFromString(dateTime: _acknowledgedAt)
        } else {
            acknowledgedAt = nil
        }

        createdBy = try container.decodeIfPresent(UserCollaborations.self, forKey: .createdBy)
        if let _createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) {
            createdAt = try Utils.Dates.dateTimeFromString(dateTime: _createdAt)
        } else {
            createdAt = nil
        }

        if let _modifiedAt = try container.decodeIfPresent(String.self, forKey: .modifiedAt) {
            modifiedAt = try Utils.Dates.dateTimeFromString(dateTime: _modifiedAt)
        } else {
            modifiedAt = nil
        }

        acceptanceRequirementsStatus = try container.decodeIfPresent(CollaborationAcceptanceRequirementsStatusField.self, forKey: .acceptanceRequirementsStatus)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(item, forKey: .item)
        try container.encodeIfPresent(accessibleBy, forKey: .accessibleBy)
        try container.encodeIfPresent(inviteEmail, forKey: .inviteEmail)
        try container.encodeIfPresent(role, forKey: .role)
        if let expiresAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: expiresAt), forKey: .expiresAt)
        }

        try container.encodeIfPresent(isAccessOnly, forKey: .isAccessOnly)
        try container.encodeIfPresent(status, forKey: .status)
        if let acknowledgedAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: acknowledgedAt), forKey: .acknowledgedAt)
        }

        try container.encodeIfPresent(createdBy, forKey: .createdBy)
        if let createdAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: createdAt), forKey: .createdAt)
        }

        if let modifiedAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: modifiedAt), forKey: .modifiedAt)
        }

        try container.encodeIfPresent(acceptanceRequirementsStatus, forKey: .acceptanceRequirementsStatus)
    }

}
