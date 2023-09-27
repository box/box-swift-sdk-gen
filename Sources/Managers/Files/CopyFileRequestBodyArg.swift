import Foundation

public class CopyFileRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case name
        case version
        case parent
    }

    /// An optional new name for the copied file.
    /// 
    /// There are some restrictions to the file name. Names containing
    /// non-printable ASCII characters, forward and backward slashes
    /// (`/`, `\`), and protected names like `.` and `..` are
    /// automatically sanitized by removing the non-allowed
    /// characters.,
    public let name: String?
    /// An optional ID of the specific file version to copy.,
    public let version: String?
    /// The destination folder to copy the file to.,
    public let parent: CopyFileRequestBodyArgParentField

    /// Initializer for a CopyFileRequestBodyArg.
    ///
    /// - Parameters:
    ///   - name: An optional new name for the copied file.
    ///     
    ///     There are some restrictions to the file name. Names containing
    ///     non-printable ASCII characters, forward and backward slashes
    ///     (`/`, `\`), and protected names like `.` and `..` are
    ///     automatically sanitized by removing the non-allowed
    ///     characters.
    ///   - version: An optional ID of the specific file version to copy.
    ///   - parent: The destination folder to copy the file to.
    public init(name: String? = nil, version: String? = nil, parent: CopyFileRequestBodyArgParentField) {
        self.name = name
        self.version = version
        self.parent = parent
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        version = try container.decodeIfPresent(String.self, forKey: .version)
        parent = try container.decode(CopyFileRequestBodyArgParentField.self, forKey: .parent)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(version, forKey: .version)
        try container.encode(parent, forKey: .parent)
    }
}
