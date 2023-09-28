import Foundation

public class FolderLockLockedOperationsField: Codable {
    private enum CodingKeys: String, CodingKey {
        case move
        case delete
    }

    /// Whether moving the folder is restricted.,
    public let move: Bool
    /// Whether deleting the folder is restricted.,
    public let delete: Bool

    /// Initializer for a FolderLockLockedOperationsField.
    ///
    /// - Parameters:
    ///   - move: Whether moving the folder is restricted.
    ///   - delete: Whether deleting the folder is restricted.
    public init(move: Bool, delete: Bool) {
        self.move = move
        self.delete = delete
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        move = try container.decode(Bool.self, forKey: .move)
        delete = try container.decode(Bool.self, forKey: .delete)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(move, forKey: .move)
        try container.encode(delete, forKey: .delete)
    }
}
