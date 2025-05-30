import Foundation

public class CreateFolderLockRequestBodyLockedOperationsField: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case move
        case delete
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// Whether moving the folder should be locked.
    public let move: Bool

    /// Whether deleting the folder should be locked.
    public let delete: Bool

    /// Initializer for a CreateFolderLockRequestBodyLockedOperationsField.
    ///
    /// - Parameters:
    ///   - move: Whether moving the folder should be locked.
    ///   - delete: Whether deleting the folder should be locked.
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
