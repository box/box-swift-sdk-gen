import Foundation

public class CreateFolderLockRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case lockedOperations = "locked_operations"
        case folder
    }

    /// The operations to lock for the folder. If `locked_operations` is
    /// included in the request, both `move` and `delete` must also be
    /// included and both set to `true`.,
    public let lockedOperations: CreateFolderLockRequestBodyArgLockedOperationsField?
    /// The folder to apply the lock to.,
    public let folder: CreateFolderLockRequestBodyArgFolderField

    /// Initializer for a CreateFolderLockRequestBodyArg.
    ///
    /// - Parameters:
    ///   - lockedOperations: The operations to lock for the folder. If `locked_operations` is
    ///     included in the request, both `move` and `delete` must also be
    ///     included and both set to `true`.
    ///   - folder: The folder to apply the lock to.
    public init(lockedOperations: CreateFolderLockRequestBodyArgLockedOperationsField? = nil, folder: CreateFolderLockRequestBodyArgFolderField) {
        self.lockedOperations = lockedOperations
        self.folder = folder
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        lockedOperations = try container.decodeIfPresent(CreateFolderLockRequestBodyArgLockedOperationsField.self, forKey: .lockedOperations)
        folder = try container.decode(CreateFolderLockRequestBodyArgFolderField.self, forKey: .folder)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(lockedOperations, forKey: .lockedOperations)
        try container.encode(folder, forKey: .folder)
    }
}
