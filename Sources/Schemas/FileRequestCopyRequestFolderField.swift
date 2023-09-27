import Foundation

public class FileRequestCopyRequestFolderField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
    }

    /// `folder`,
    public let type: FileRequestCopyRequestFolderFieldTypeField?
    /// The ID of the folder to associate the new
    /// file request to.,
    public let id: String

    /// Initializer for a FileRequestCopyRequestFolderField.
    ///
    /// - Parameters:
    ///   - type: `folder`
    ///   - id: The ID of the folder to associate the new
    ///     file request to.
    public init(type: FileRequestCopyRequestFolderFieldTypeField? = nil, id: String) {
        self.type = type
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(FileRequestCopyRequestFolderFieldTypeField.self, forKey: .type)
        id = try container.decode(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encode(id, forKey: .id)
    }
}
