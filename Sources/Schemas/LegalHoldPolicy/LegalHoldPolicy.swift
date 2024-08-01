import Foundation

/// Legal Hold Policy information describes the basic
/// characteristics of the Policy, such as name, description,
/// and filter dates.
public class LegalHoldPolicy: LegalHoldPolicyMini {
    private enum CodingKeys: String, CodingKey {
        case policyName = "policy_name"
        case description
        case status
        case assignmentCounts = "assignment_counts"
        case createdBy = "created_by"
        case createdAt = "created_at"
        case modifiedAt = "modified_at"
        case deletedAt = "deleted_at"
        case filterStartedAt = "filter_started_at"
        case filterEndedAt = "filter_ended_at"
        case releaseNotes = "release_notes"
    }

    /// Name of the legal hold policy.
    public let policyName: String?

    /// Description of the legal hold policy. Optional
    /// property with a 500 character limit.
    public let description: String?

    /// * 'active' - the policy is not in a transition state
    /// * 'applying' - that the policy is in the process of
    ///   being applied
    /// * 'releasing' - that the process is in the process
    ///   of being released
    /// * 'released' - the policy is no longer active
    public let status: LegalHoldPolicyStatusField?

    /// Counts of assignments within this a legal hold policy by item type
    public let assignmentCounts: LegalHoldPolicyAssignmentCountsField?

    public let createdBy: UserMini?

    /// When the legal hold policy object was created
    public let createdAt: Date?

    /// When the legal hold policy object was modified.
    /// Does not update when assignments are added or removed.
    public let modifiedAt: Date?

    /// When the policy release request was sent. (Because
    /// it can take time for a policy to fully delete, this
    /// isn't quite the same time that the policy is fully deleted).
    /// 
    /// If `null`, the policy was not deleted.
    public let deletedAt: Date?

    /// User-specified, optional date filter applies to
    /// Custodian assignments only
    public let filterStartedAt: Date?

    /// User-specified, optional date filter applies to
    /// Custodian assignments only
    public let filterEndedAt: Date?

    /// Optional notes about why the policy was created.
    public let releaseNotes: String?

    /// Initializer for a LegalHoldPolicy.
    ///
    /// - Parameters:
    ///   - id: The unique identifier for this legal hold policy
    ///   - type: `legal_hold_policy`
    ///   - policyName: Name of the legal hold policy.
    ///   - description: Description of the legal hold policy. Optional
    ///     property with a 500 character limit.
    ///   - status: * 'active' - the policy is not in a transition state
    ///     * 'applying' - that the policy is in the process of
    ///       being applied
    ///     * 'releasing' - that the process is in the process
    ///       of being released
    ///     * 'released' - the policy is no longer active
    ///   - assignmentCounts: Counts of assignments within this a legal hold policy by item type
    ///   - createdBy: 
    ///   - createdAt: When the legal hold policy object was created
    ///   - modifiedAt: When the legal hold policy object was modified.
    ///     Does not update when assignments are added or removed.
    ///   - deletedAt: When the policy release request was sent. (Because
    ///     it can take time for a policy to fully delete, this
    ///     isn't quite the same time that the policy is fully deleted).
    ///     
    ///     If `null`, the policy was not deleted.
    ///   - filterStartedAt: User-specified, optional date filter applies to
    ///     Custodian assignments only
    ///   - filterEndedAt: User-specified, optional date filter applies to
    ///     Custodian assignments only
    ///   - releaseNotes: Optional notes about why the policy was created.
    public init(id: String, type: LegalHoldPolicyMiniTypeField = LegalHoldPolicyMiniTypeField.legalHoldPolicy, policyName: String? = nil, description: String? = nil, status: LegalHoldPolicyStatusField? = nil, assignmentCounts: LegalHoldPolicyAssignmentCountsField? = nil, createdBy: UserMini? = nil, createdAt: Date? = nil, modifiedAt: Date? = nil, deletedAt: Date? = nil, filterStartedAt: Date? = nil, filterEndedAt: Date? = nil, releaseNotes: String? = nil) {
        self.policyName = policyName
        self.description = description
        self.status = status
        self.assignmentCounts = assignmentCounts
        self.createdBy = createdBy
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.deletedAt = deletedAt
        self.filterStartedAt = filterStartedAt
        self.filterEndedAt = filterEndedAt
        self.releaseNotes = releaseNotes

        super.init(id: id, type: type)
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        policyName = try container.decodeIfPresent(String.self, forKey: .policyName)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        status = try container.decodeIfPresent(LegalHoldPolicyStatusField.self, forKey: .status)
        assignmentCounts = try container.decodeIfPresent(LegalHoldPolicyAssignmentCountsField.self, forKey: .assignmentCounts)
        createdBy = try container.decodeIfPresent(UserMini.self, forKey: .createdBy)
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

        if let _deletedAt = try container.decodeIfPresent(String.self, forKey: .deletedAt) {
            deletedAt = try Utils.Dates.dateTimeFromString(dateTime: _deletedAt)
        } else {
            deletedAt = nil
        }

        if let _filterStartedAt = try container.decodeIfPresent(String.self, forKey: .filterStartedAt) {
            filterStartedAt = try Utils.Dates.dateTimeFromString(dateTime: _filterStartedAt)
        } else {
            filterStartedAt = nil
        }

        if let _filterEndedAt = try container.decodeIfPresent(String.self, forKey: .filterEndedAt) {
            filterEndedAt = try Utils.Dates.dateTimeFromString(dateTime: _filterEndedAt)
        } else {
            filterEndedAt = nil
        }

        releaseNotes = try container.decodeIfPresent(String.self, forKey: .releaseNotes)

        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(policyName, forKey: .policyName)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(assignmentCounts, forKey: .assignmentCounts)
        try container.encodeIfPresent(createdBy, forKey: .createdBy)
        if let createdAt = createdAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: createdAt), forKey: .createdAt)
        }

        if let modifiedAt = modifiedAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: modifiedAt), forKey: .modifiedAt)
        }

        if let deletedAt = deletedAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: deletedAt), forKey: .deletedAt)
        }

        if let filterStartedAt = filterStartedAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: filterStartedAt), forKey: .filterStartedAt)
        }

        if let filterEndedAt = filterEndedAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: filterEndedAt), forKey: .filterEndedAt)
        }

        try container.encodeIfPresent(releaseNotes, forKey: .releaseNotes)
        try super.encode(to: encoder)
    }

}
