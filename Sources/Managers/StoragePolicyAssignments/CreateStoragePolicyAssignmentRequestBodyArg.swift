import Foundation

public class CreateStoragePolicyAssignmentRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case storagePolicy = "storage_policy"
        case assignedTo = "assigned_to"
    }

    /// The storage policy to assign to the user or
    /// enterprise,
    public let storagePolicy: CreateStoragePolicyAssignmentRequestBodyArgStoragePolicyField
    /// The user or enterprise to assign the storage
    /// policy to.,
    public let assignedTo: CreateStoragePolicyAssignmentRequestBodyArgAssignedToField

    /// Initializer for a CreateStoragePolicyAssignmentRequestBodyArg.
    ///
    /// - Parameters:
    ///   - storagePolicy: The storage policy to assign to the user or
    ///     enterprise
    ///   - assignedTo: The user or enterprise to assign the storage
    ///     policy to.
    public init(storagePolicy: CreateStoragePolicyAssignmentRequestBodyArgStoragePolicyField, assignedTo: CreateStoragePolicyAssignmentRequestBodyArgAssignedToField) {
        self.storagePolicy = storagePolicy
        self.assignedTo = assignedTo
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        storagePolicy = try container.decode(CreateStoragePolicyAssignmentRequestBodyArgStoragePolicyField.self, forKey: .storagePolicy)
        assignedTo = try container.decode(CreateStoragePolicyAssignmentRequestBodyArgAssignedToField.self, forKey: .assignedTo)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(storagePolicy, forKey: .storagePolicy)
        try container.encode(assignedTo, forKey: .assignedTo)
    }
}
