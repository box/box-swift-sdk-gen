import Foundation

public class CopyFolderRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case name
        case parent
    }

    /// An optional new name for the copied folder.
    /// 
    /// There are some restrictions to the file name. Names containing
    /// non-printable ASCII characters, forward and backward slashes
    /// (`/`, `\`), as well as names with trailing spaces are
    /// prohibited.
    /// 
    /// Additionally, the names `.` and `..` are
    /// not allowed either.,
    public let name: String?
    /// The destination folder to copy the folder to.,
    public let parent: CopyFolderRequestBodyArgParentField

    /// Initializer for a CopyFolderRequestBodyArg.
    ///
    /// - Parameters:
    ///   - name: An optional new name for the copied folder.
    ///     
    ///     There are some restrictions to the file name. Names containing
    ///     non-printable ASCII characters, forward and backward slashes
    ///     (`/`, `\`), as well as names with trailing spaces are
    ///     prohibited.
    ///     
    ///     Additionally, the names `.` and `..` are
    ///     not allowed either.
    ///   - parent: The destination folder to copy the folder to.
    public init(name: String? = nil, parent: CopyFolderRequestBodyArgParentField) {
        self.name = name
        self.parent = parent
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        parent = try container.decode(CopyFolderRequestBodyArgParentField.self, forKey: .parent)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encode(parent, forKey: .parent)
    }
}
