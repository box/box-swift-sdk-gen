import Foundation

public class FileFullLockField: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case createdBy = "created_by"
        case createdAt = "created_at"
        case expiredAt = "expired_at"
        case isDownloadPrevented = "is_download_prevented"
        case appType = "app_type"
    }

    /// The unique identifier for this lock
    public let id: String?

    /// `lock`
    public let type: FileFullLockTypeField?

    public let createdBy: UserMini?

    /// The time this lock was created at.
    public let createdAt: Date?

    /// The time this lock is to expire at, which might be in the past.
    public let expiredAt: Date?

    /// Whether or not the file can be downloaded while locked.
    public let isDownloadPrevented: Bool?

    /// If the lock is managed by an application rather than a user, this
    /// field identifies the type of the application that holds the lock.
    /// This is an open enum and may be extended with additional values in
    /// the future.
    public let appType: FileFullLockAppTypeField?

    /// Initializer for a FileFullLockField.
    ///
    /// - Parameters:
    ///   - id: The unique identifier for this lock
    ///   - type: `lock`
    ///   - createdBy: 
    ///   - createdAt: The time this lock was created at.
    ///   - expiredAt: The time this lock is to expire at, which might be in the past.
    ///   - isDownloadPrevented: Whether or not the file can be downloaded while locked.
    ///   - appType: If the lock is managed by an application rather than a user, this
    ///     field identifies the type of the application that holds the lock.
    ///     This is an open enum and may be extended with additional values in
    ///     the future.
    public init(id: String? = nil, type: FileFullLockTypeField? = nil, createdBy: UserMini? = nil, createdAt: Date? = nil, expiredAt: Date? = nil, isDownloadPrevented: Bool? = nil, appType: FileFullLockAppTypeField? = nil) {
        self.id = id
        self.type = type
        self.createdBy = createdBy
        self.createdAt = createdAt
        self.expiredAt = expiredAt
        self.isDownloadPrevented = isDownloadPrevented
        self.appType = appType
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        type = try container.decodeIfPresent(FileFullLockTypeField.self, forKey: .type)
        createdBy = try container.decodeIfPresent(UserMini.self, forKey: .createdBy)
        if let _createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) {
            createdAt = try Utils.Dates.dateTimeFromString(dateTime: _createdAt)
        } else {
            createdAt = nil
        }

        if let _expiredAt = try container.decodeIfPresent(String.self, forKey: .expiredAt) {
            expiredAt = try Utils.Dates.dateTimeFromString(dateTime: _expiredAt)
        } else {
            expiredAt = nil
        }

        isDownloadPrevented = try container.decodeIfPresent(Bool.self, forKey: .isDownloadPrevented)
        appType = try container.decodeIfPresent(FileFullLockAppTypeField.self, forKey: .appType)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(createdBy, forKey: .createdBy)
        if let createdAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: createdAt), forKey: .createdAt)
        }

        if let expiredAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: expiredAt), forKey: .expiredAt)
        }

        try container.encodeIfPresent(isDownloadPrevented, forKey: .isDownloadPrevented)
        try container.encodeIfPresent(appType, forKey: .appType)
    }

}
