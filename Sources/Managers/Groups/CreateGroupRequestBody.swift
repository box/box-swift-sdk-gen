import Foundation

public class CreateGroupRequestBody: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case name
        case provenance
        case externalSyncIdentifier = "external_sync_identifier"
        case description
        case invitabilityLevel = "invitability_level"
        case memberViewabilityLevel = "member_viewability_level"
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// The name of the new group to be created. This name must be unique
    /// within the enterprise.
    public let name: String

    /// Keeps track of which external source this group is
    /// coming, for example `Active Directory`, or `Okta`.
    /// 
    /// Setting this will also prevent Box admins from editing
    /// the group name and its members directly via the Box
    /// web application.
    /// 
    /// This is desirable for one-way syncing of groups.
    public let provenance: String?

    /// An arbitrary identifier that can be used by
    /// external group sync tools to link this Box Group to
    /// an external group.
    /// 
    /// Example values of this field
    /// could be an **Active Directory Object ID** or a **Google
    /// Group ID**.
    /// 
    /// We recommend you use of this field in
    /// order to avoid issues when group names are updated in
    /// either Box or external systems.
    public let externalSyncIdentifier: String?

    /// A human readable description of the group.
    public let description: String?

    /// Specifies who can invite the group to collaborate
    /// on folders.
    /// 
    /// When set to `admins_only` the enterprise admin, co-admins,
    /// and the group's admin can invite the group.
    /// 
    /// When set to `admins_and_members` all the admins listed
    /// above and group members can invite the group.
    /// 
    /// When set to `all_managed_users` all managed users in the
    /// enterprise can invite the group.
    public let invitabilityLevel: CreateGroupRequestBodyInvitabilityLevelField?

    /// Specifies who can see the members of the group.
    /// 
    /// * `admins_only` - the enterprise admin, co-admins, group's
    ///   group admin.
    /// * `admins_and_members` - all admins and group members.
    /// * `all_managed_users` - all managed users in the
    ///   enterprise.
    public let memberViewabilityLevel: CreateGroupRequestBodyMemberViewabilityLevelField?

    /// Initializer for a CreateGroupRequestBody.
    ///
    /// - Parameters:
    ///   - name: The name of the new group to be created. This name must be unique
    ///     within the enterprise.
    ///   - provenance: Keeps track of which external source this group is
    ///     coming, for example `Active Directory`, or `Okta`.
    ///     
    ///     Setting this will also prevent Box admins from editing
    ///     the group name and its members directly via the Box
    ///     web application.
    ///     
    ///     This is desirable for one-way syncing of groups.
    ///   - externalSyncIdentifier: An arbitrary identifier that can be used by
    ///     external group sync tools to link this Box Group to
    ///     an external group.
    ///     
    ///     Example values of this field
    ///     could be an **Active Directory Object ID** or a **Google
    ///     Group ID**.
    ///     
    ///     We recommend you use of this field in
    ///     order to avoid issues when group names are updated in
    ///     either Box or external systems.
    ///   - description: A human readable description of the group.
    ///   - invitabilityLevel: Specifies who can invite the group to collaborate
    ///     on folders.
    ///     
    ///     When set to `admins_only` the enterprise admin, co-admins,
    ///     and the group's admin can invite the group.
    ///     
    ///     When set to `admins_and_members` all the admins listed
    ///     above and group members can invite the group.
    ///     
    ///     When set to `all_managed_users` all managed users in the
    ///     enterprise can invite the group.
    ///   - memberViewabilityLevel: Specifies who can see the members of the group.
    ///     
    ///     * `admins_only` - the enterprise admin, co-admins, group's
    ///       group admin.
    ///     * `admins_and_members` - all admins and group members.
    ///     * `all_managed_users` - all managed users in the
    ///       enterprise.
    public init(name: String, provenance: String? = nil, externalSyncIdentifier: String? = nil, description: String? = nil, invitabilityLevel: CreateGroupRequestBodyInvitabilityLevelField? = nil, memberViewabilityLevel: CreateGroupRequestBodyMemberViewabilityLevelField? = nil) {
        self.name = name
        self.provenance = provenance
        self.externalSyncIdentifier = externalSyncIdentifier
        self.description = description
        self.invitabilityLevel = invitabilityLevel
        self.memberViewabilityLevel = memberViewabilityLevel
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        provenance = try container.decodeIfPresent(String.self, forKey: .provenance)
        externalSyncIdentifier = try container.decodeIfPresent(String.self, forKey: .externalSyncIdentifier)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        invitabilityLevel = try container.decodeIfPresent(CreateGroupRequestBodyInvitabilityLevelField.self, forKey: .invitabilityLevel)
        memberViewabilityLevel = try container.decodeIfPresent(CreateGroupRequestBodyMemberViewabilityLevelField.self, forKey: .memberViewabilityLevel)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(provenance, forKey: .provenance)
        try container.encodeIfPresent(externalSyncIdentifier, forKey: .externalSyncIdentifier)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(invitabilityLevel, forKey: .invitabilityLevel)
        try container.encodeIfPresent(memberViewabilityLevel, forKey: .memberViewabilityLevel)
    }

    /// Sets the raw JSON data.
    ///
    /// - Parameters:
    ///   - rawData: A dictionary containing the raw JSON data
    func setRawData(rawData: [String: Any]?) {
        self._rawData = rawData
    }

    /// Gets the raw JSON data
    /// - Returns: The `[String: Any]?`.
    func getRawData() -> [String: Any]? {
        return self._rawData
    }

}
