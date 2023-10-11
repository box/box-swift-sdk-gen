import Foundation

/// A standard representation of a file version
public class FileVersion: FileVersionMini {
    private enum CodingKeys: String, CodingKey {
        case name
        case size
        case createdAt = "created_at"
        case modifiedAt = "modified_at"
        case modifiedBy = "modified_by"
        case trashedAt = "trashed_at"
        case trashedBy = "trashed_by"
        case restoredAt = "restored_at"
        case restoredBy = "restored_by"
        case purgedAt = "purged_at"
        case uploaderDisplayName = "uploader_display_name"
    }

    /// The name of the file version
    public let name: String?
    /// Size of the file version in bytes
    public let size: Int64?
    /// When the file version object was created
    public let createdAt: String?
    /// When the file version object was last updated
    public let modifiedAt: String?
    public let modifiedBy: UserMini?
    /// When the file version object was trashed.
    public let trashedAt: String?
    public let trashedBy: UserMini?
    /// When the file version was restored from the trash.
    public let restoredAt: String?
    public let restoredBy: UserMini?
    /// When the file version object will be permanently deleted.
    public let purgedAt: String?
    public let uploaderDisplayName: String?

    /// Initializer for a FileVersion.
    ///
    /// - Parameters:
    ///   - id: The unique identifier that represent a file version.
    ///   - type: `file_version`
    ///   - sha1: The SHA1 hash of this version of the file.
    ///   - name: The name of the file version
    ///   - size: Size of the file version in bytes
    ///   - createdAt: When the file version object was created
    ///   - modifiedAt: When the file version object was last updated
    ///   - modifiedBy: UserMini?
    ///   - trashedAt: When the file version object was trashed.
    ///   - trashedBy: UserMini?
    ///   - restoredAt: When the file version was restored from the trash.
    ///   - restoredBy: UserMini?
    ///   - purgedAt: When the file version object will be permanently deleted.
    ///   - uploaderDisplayName: String?
    public init(id: String, type: FileVersionBaseTypeField, sha1: String? = nil, name: String? = nil, size: Int64? = nil, createdAt: String? = nil, modifiedAt: String? = nil, modifiedBy: UserMini? = nil, trashedAt: String? = nil, trashedBy: UserMini? = nil, restoredAt: String? = nil, restoredBy: UserMini? = nil, purgedAt: String? = nil, uploaderDisplayName: String? = nil) {
        self.name = name
        self.size = size
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.modifiedBy = modifiedBy
        self.trashedAt = trashedAt
        self.trashedBy = trashedBy
        self.restoredAt = restoredAt
        self.restoredBy = restoredBy
        self.purgedAt = purgedAt
        self.uploaderDisplayName = uploaderDisplayName
        super.init(id: id, type: type, sha1: sha1)
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        size = try container.decodeIfPresent(Int64.self, forKey: .size)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        modifiedAt = try container.decodeIfPresent(String.self, forKey: .modifiedAt)
        modifiedBy = try container.decodeIfPresent(UserMini.self, forKey: .modifiedBy)
        trashedAt = try container.decodeIfPresent(String.self, forKey: .trashedAt)
        trashedBy = try container.decodeIfPresent(UserMini.self, forKey: .trashedBy)
        restoredAt = try container.decodeIfPresent(String.self, forKey: .restoredAt)
        restoredBy = try container.decodeIfPresent(UserMini.self, forKey: .restoredBy)
        purgedAt = try container.decodeIfPresent(String.self, forKey: .purgedAt)
        uploaderDisplayName = try container.decodeIfPresent(String.self, forKey: .uploaderDisplayName)
        try super.init(from:decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(size, forKey: .size)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(modifiedAt, forKey: .modifiedAt)
        try container.encodeIfPresent(modifiedBy, forKey: .modifiedBy)
        try container.encodeIfPresent(trashedAt, forKey: .trashedAt)
        try container.encodeIfPresent(trashedBy, forKey: .trashedBy)
        try container.encodeIfPresent(restoredAt, forKey: .restoredAt)
        try container.encodeIfPresent(restoredBy, forKey: .restoredBy)
        try container.encodeIfPresent(purgedAt, forKey: .purgedAt)
        try container.encodeIfPresent(uploaderDisplayName, forKey: .uploaderDisplayName)
        try super.encode(to: encoder)
    }
}
