import Foundation

public class UploadFileRequestBodyArgAttributesField: Codable {
    private enum CodingKeys: String, CodingKey {
        case name
        case parent
        case contentCreatedAt = "content_created_at"
        case contentModifiedAt = "content_modified_at"
    }

    /// The name of the file
    public let name: String
    /// The parent folder to upload the file to
    public let parent: UploadFileRequestBodyArgAttributesFieldParentField
    /// Defines the time the file was originally created at.
    /// 
    /// If not set, the upload time will be used.
    public let contentCreatedAt: String?
    /// Defines the time the file was last modified at.
    /// 
    /// If not set, the upload time will be used.
    public let contentModifiedAt: String?

    /// Initializer for a UploadFileRequestBodyArgAttributesField.
    ///
    /// - Parameters:
    ///   - name: The name of the file
    ///   - parent: The parent folder to upload the file to
    ///   - contentCreatedAt: Defines the time the file was originally created at.
    ///     
    ///     If not set, the upload time will be used.
    ///   - contentModifiedAt: Defines the time the file was last modified at.
    ///     
    ///     If not set, the upload time will be used.
    public init(name: String, parent: UploadFileRequestBodyArgAttributesFieldParentField, contentCreatedAt: String? = nil, contentModifiedAt: String? = nil) {
        self.name = name
        self.parent = parent
        self.contentCreatedAt = contentCreatedAt
        self.contentModifiedAt = contentModifiedAt
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        parent = try container.decode(UploadFileRequestBodyArgAttributesFieldParentField.self, forKey: .parent)
        contentCreatedAt = try container.decodeIfPresent(String.self, forKey: .contentCreatedAt)
        contentModifiedAt = try container.decodeIfPresent(String.self, forKey: .contentModifiedAt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(parent, forKey: .parent)
        try container.encodeIfPresent(contentCreatedAt, forKey: .contentCreatedAt)
        try container.encodeIfPresent(contentModifiedAt, forKey: .contentModifiedAt)
    }
}
