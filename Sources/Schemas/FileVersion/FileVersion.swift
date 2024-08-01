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
    public let createdAt: Date?

    /// When the file version object was last updated
    public let modifiedAt: Date?

    public let modifiedBy: UserMini?

    /// When the file version object was trashed.
    public let trashedAt: Date?

    public let trashedBy: UserMini?

    /// When the file version was restored from the trash.
    public let restoredAt: Date?

    public let restoredBy: UserMini?

    /// When the file version object will be permanently deleted.
    public let purgedAt: Date?

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
    ///   - modifiedBy: 
    ///   - trashedAt: When the file version object was trashed.
    ///   - trashedBy: 
    ///   - restoredAt: When the file version was restored from the trash.
    ///   - restoredBy: 
    ///   - purgedAt: When the file version object will be permanently deleted.
    ///   - uploaderDisplayName: 
    public init(id: String, type: FileVersionBaseTypeField = FileVersionBaseTypeField.fileVersion, sha1: String? = nil, name: String? = nil, size: Int64? = nil, createdAt: Date? = nil, modifiedAt: Date? = nil, modifiedBy: UserMini? = nil, trashedAt: Date? = nil, trashedBy: UserMini? = nil, restoredAt: Date? = nil, restoredBy: UserMini? = nil, purgedAt: Date? = nil, uploaderDisplayName: String? = nil) {
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
        if let _createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) {
            createdAt = try Utils.Dates.dateTimeFromString(dateTime: _createdAt)
        } else {
            createdAt = nil
        }

        if let _modifiedAt = try container.decodeIfPresent(String.self, forKey: .modifiedAt) {
            modifiedAt = try Utils.Dates.dateTimeFromString(dateTime: _modifiedAt)
        } else {
            modifiedAt = nil
        }

        modifiedBy = try container.decodeIfPresent(UserMini.self, forKey: .modifiedBy)
        if let _trashedAt = try container.decodeIfPresent(String.self, forKey: .trashedAt) {
            trashedAt = try Utils.Dates.dateTimeFromString(dateTime: _trashedAt)
        } else {
            trashedAt = nil
        }

        trashedBy = try container.decodeIfPresent(UserMini.self, forKey: .trashedBy)
        if let _restoredAt = try container.decodeIfPresent(String.self, forKey: .restoredAt) {
            restoredAt = try Utils.Dates.dateTimeFromString(dateTime: _restoredAt)
        } else {
            restoredAt = nil
        }

        restoredBy = try container.decodeIfPresent(UserMini.self, forKey: .restoredBy)
        if let _purgedAt = try container.decodeIfPresent(String.self, forKey: .purgedAt) {
            purgedAt = try Utils.Dates.dateTimeFromString(dateTime: _purgedAt)
        } else {
            purgedAt = nil
        }

        uploaderDisplayName = try container.decodeIfPresent(String.self, forKey: .uploaderDisplayName)

        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(size, forKey: .size)
        if let createdAt = createdAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: createdAt), forKey: .createdAt)
        }

        if let modifiedAt = modifiedAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: modifiedAt), forKey: .modifiedAt)
        }

        try container.encodeIfPresent(modifiedBy, forKey: .modifiedBy)
        if let trashedAt = trashedAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: trashedAt), forKey: .trashedAt)
        }

        try container.encodeIfPresent(trashedBy, forKey: .trashedBy)
        if let restoredAt = restoredAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: restoredAt), forKey: .restoredAt)
        }

        try container.encodeIfPresent(restoredBy, forKey: .restoredBy)
        if let purgedAt = purgedAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: purgedAt), forKey: .purgedAt)
        }

        try container.encodeIfPresent(uploaderDisplayName, forKey: .uploaderDisplayName)
        try super.encode(to: encoder)
    }

}
