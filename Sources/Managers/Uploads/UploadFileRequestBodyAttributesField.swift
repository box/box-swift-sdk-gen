import Foundation

public class UploadFileRequestBodyAttributesField: Codable {
    private enum CodingKeys: String, CodingKey {
        case name
        case parent
        case contentCreatedAt = "content_created_at"
        case contentModifiedAt = "content_modified_at"
    }

    /// The name of the file
    public let name: String

    /// The parent folder to upload the file to
    public let parent: UploadFileRequestBodyAttributesParentField

    /// Defines the time the file was originally created at.
    /// 
    /// If not set, the upload time will be used.
    public let contentCreatedAt: Date?

    /// Defines the time the file was last modified at.
    /// 
    /// If not set, the upload time will be used.
    public let contentModifiedAt: Date?

    /// Initializer for a UploadFileRequestBodyAttributesField.
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
    public init(name: String, parent: UploadFileRequestBodyAttributesParentField, contentCreatedAt: Date? = nil, contentModifiedAt: Date? = nil) {
        self.name = name
        self.parent = parent
        self.contentCreatedAt = contentCreatedAt
        self.contentModifiedAt = contentModifiedAt
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        parent = try container.decode(UploadFileRequestBodyAttributesParentField.self, forKey: .parent)
        if let _contentCreatedAt = try container.decodeIfPresent(String.self, forKey: .contentCreatedAt) {
            contentCreatedAt = try Utils.Dates.dateTimeFromString(dateTime: _contentCreatedAt)
        } else {
            contentCreatedAt = nil
        }

        if let _contentModifiedAt = try container.decodeIfPresent(String.self, forKey: .contentModifiedAt) {
            contentModifiedAt = try Utils.Dates.dateTimeFromString(dateTime: _contentModifiedAt)
        } else {
            contentModifiedAt = nil
        }

    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(parent, forKey: .parent)
        if let contentCreatedAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: contentCreatedAt), forKey: .contentCreatedAt)
        }

        if let contentModifiedAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: contentModifiedAt), forKey: .contentModifiedAt)
        }

    }

}
