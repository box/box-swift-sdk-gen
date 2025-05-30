import Foundation

public class CopyFileRequestBody: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case parent
        case name
        case version
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// The destination folder to copy the file to.
    public let parent: CopyFileRequestBodyParentField

    /// An optional new name for the copied file.
    /// 
    /// There are some restrictions to the file name. Names containing
    /// non-printable ASCII characters, forward and backward slashes
    /// (`/`, `\`), and protected names like `.` and `..` are
    /// automatically sanitized by removing the non-allowed
    /// characters.
    public let name: String?

    /// An optional ID of the specific file version to copy.
    public let version: String?

    /// Initializer for a CopyFileRequestBody.
    ///
    /// - Parameters:
    ///   - parent: The destination folder to copy the file to.
    ///   - name: An optional new name for the copied file.
    ///     
    ///     There are some restrictions to the file name. Names containing
    ///     non-printable ASCII characters, forward and backward slashes
    ///     (`/`, `\`), and protected names like `.` and `..` are
    ///     automatically sanitized by removing the non-allowed
    ///     characters.
    ///   - version: An optional ID of the specific file version to copy.
    public init(parent: CopyFileRequestBodyParentField, name: String? = nil, version: String? = nil) {
        self.parent = parent
        self.name = name
        self.version = version
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        parent = try container.decode(CopyFileRequestBodyParentField.self, forKey: .parent)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(parent, forKey: .parent)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(version, forKey: .version)
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
