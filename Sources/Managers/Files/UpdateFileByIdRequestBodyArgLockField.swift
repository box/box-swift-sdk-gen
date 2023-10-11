import Foundation

public class UpdateFileByIdRequestBodyArgLockField: Codable {
    private enum CodingKeys: String, CodingKey {
        case access
        case expiresAt = "expires_at"
        case isDownloadPrevented = "is_download_prevented"
    }

    /// The type of this object.
    public let access: UpdateFileByIdRequestBodyArgLockFieldAccessField?
    /// Defines the time at which the lock expires.
    public let expiresAt: String?
    /// Defines if the file can be downloaded while it is locked.
    public let isDownloadPrevented: Bool?

    /// Initializer for a UpdateFileByIdRequestBodyArgLockField.
    ///
    /// - Parameters:
    ///   - access: The type of this object.
    ///   - expiresAt: Defines the time at which the lock expires.
    ///   - isDownloadPrevented: Defines if the file can be downloaded while it is locked.
    public init(access: UpdateFileByIdRequestBodyArgLockFieldAccessField? = nil, expiresAt: String? = nil, isDownloadPrevented: Bool? = nil) {
        self.access = access
        self.expiresAt = expiresAt
        self.isDownloadPrevented = isDownloadPrevented
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        access = try container.decodeIfPresent(UpdateFileByIdRequestBodyArgLockFieldAccessField.self, forKey: .access)
        expiresAt = try container.decodeIfPresent(String.self, forKey: .expiresAt)
        isDownloadPrevented = try container.decodeIfPresent(Bool.self, forKey: .isDownloadPrevented)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(access, forKey: .access)
        try container.encodeIfPresent(expiresAt, forKey: .expiresAt)
        try container.encodeIfPresent(isDownloadPrevented, forKey: .isDownloadPrevented)
    }
}
