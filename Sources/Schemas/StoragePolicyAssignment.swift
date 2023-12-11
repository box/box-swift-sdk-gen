import Foundation

/// The assignment of a storage policy to a user or enterprise
public class StoragePolicyAssignment: Codable {
    private enum CodingKeys: String, CodingKey {
        case storagePolicy = "storage_policy"
        case assignedTo = "assigned_to"
    }

    public let storagePolicy: StoragePolicyMini?

    public let assignedTo: StoragePolicyAssignmentAssignedToField?

    public init(storagePolicy: StoragePolicyMini? = nil, assignedTo: StoragePolicyAssignmentAssignedToField? = nil) {
        self.storagePolicy = storagePolicy
        self.assignedTo = assignedTo
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        storagePolicy = try container.decodeIfPresent(StoragePolicyMini.self, forKey: .storagePolicy)
        assignedTo = try container.decodeIfPresent(StoragePolicyAssignmentAssignedToField.self, forKey: .assignedTo)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(storagePolicy, forKey: .storagePolicy)
        try container.encodeIfPresent(assignedTo, forKey: .assignedTo)
    }

}
