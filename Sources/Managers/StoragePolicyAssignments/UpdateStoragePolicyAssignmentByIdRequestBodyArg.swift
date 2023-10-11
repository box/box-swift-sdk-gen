import Foundation

public class UpdateStoragePolicyAssignmentByIdRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case storagePolicy = "storage_policy"
    }

    /// The storage policy to assign to the user or
    /// enterprise
    public let storagePolicy: UpdateStoragePolicyAssignmentByIdRequestBodyArgStoragePolicyField

    /// Initializer for a UpdateStoragePolicyAssignmentByIdRequestBodyArg.
    ///
    /// - Parameters:
    ///   - storagePolicy: The storage policy to assign to the user or
    ///     enterprise
    public init(storagePolicy: UpdateStoragePolicyAssignmentByIdRequestBodyArgStoragePolicyField) {
        self.storagePolicy = storagePolicy
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        storagePolicy = try container.decode(UpdateStoragePolicyAssignmentByIdRequestBodyArgStoragePolicyField.self, forKey: .storagePolicy)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(storagePolicy, forKey: .storagePolicy)
    }
}
