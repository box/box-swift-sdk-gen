import Foundation

/// A standard representation of a file request, as returned
/// from any file request API endpoints by default.
public class FileRequest: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case folder
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case type
        case title
        case description
        case status
        case isEmailRequired = "is_email_required"
        case isDescriptionRequired = "is_description_required"
        case expiresAt = "expires_at"
        case url
        case etag
        case createdBy = "created_by"
        case updatedBy = "updated_by"
    }

    /// The unique identifier for this file request.
    public let id: String

    public let folder: FolderMini

    /// The date and time when the file request was created.
    public let createdAt: Date

    /// The date and time when the file request was last updated.
    public let updatedAt: Date

    /// `file_request`
    public let type: FileRequestTypeField

    /// The title of file request. This is shown
    /// in the Box UI to users uploading files.
    /// 
    /// This defaults to title of the file request that was
    /// copied to create this file request.
    public let title: String?

    /// The optional description of this file request. This is
    /// shown in the Box UI to users uploading files.
    /// 
    /// This defaults to description of the file request that was
    /// copied to create this file request.
    public let description: String?

    /// The status of the file request. This defaults
    /// to `active`.
    /// 
    /// When the status is set to `inactive`, the file request
    /// will no longer accept new submissions, and any visitor
    /// to the file request URL will receive a `HTTP 404` status
    /// code.
    /// 
    /// This defaults to status of file request that was
    /// copied to create this file request.
    public let status: FileRequestStatusField?

    /// Whether a file request submitter is required to provide
    /// their email address.
    /// 
    /// When this setting is set to true, the Box UI will show
    /// an email field on the file request form.
    /// 
    /// This defaults to setting of file request that was
    /// copied to create this file request.
    public let isEmailRequired: Bool?

    /// Whether a file request submitter is required to provide
    /// a description of the files they are submitting.
    /// 
    /// When this setting is set to true, the Box UI will show
    /// a description field on the file request form.
    /// 
    /// This defaults to setting of file request that was
    /// copied to create this file request.
    public let isDescriptionRequired: Bool?

    /// The date after which a file request will no longer accept new
    /// submissions.
    /// 
    /// After this date, the `status` will automatically be set to
    /// `inactive`.
    public let expiresAt: Date?

    /// The generated URL for this file request. This URL can be shared
    /// with users to let them upload files to the associated folder.
    public let url: String?

    /// The HTTP `etag` of this file. This can be used in combination with
    /// the `If-Match` header when updating a file request. By providing that
    /// header, a change will only be performed on the  file request if the `etag`
    /// on the file request still matches the `etag` provided in the `If-Match`
    /// header.
    public let etag: String?

    public let createdBy: UserMini?

    public let updatedBy: UserMini?

    /// Initializer for a FileRequest.
    ///
    /// - Parameters:
    ///   - id: The unique identifier for this file request.
    ///   - folder: 
    ///   - createdAt: The date and time when the file request was created.
    ///   - updatedAt: The date and time when the file request was last updated.
    ///   - type: `file_request`
    ///   - title: The title of file request. This is shown
    ///     in the Box UI to users uploading files.
    ///     
    ///     This defaults to title of the file request that was
    ///     copied to create this file request.
    ///   - description: The optional description of this file request. This is
    ///     shown in the Box UI to users uploading files.
    ///     
    ///     This defaults to description of the file request that was
    ///     copied to create this file request.
    ///   - status: The status of the file request. This defaults
    ///     to `active`.
    ///     
    ///     When the status is set to `inactive`, the file request
    ///     will no longer accept new submissions, and any visitor
    ///     to the file request URL will receive a `HTTP 404` status
    ///     code.
    ///     
    ///     This defaults to status of file request that was
    ///     copied to create this file request.
    ///   - isEmailRequired: Whether a file request submitter is required to provide
    ///     their email address.
    ///     
    ///     When this setting is set to true, the Box UI will show
    ///     an email field on the file request form.
    ///     
    ///     This defaults to setting of file request that was
    ///     copied to create this file request.
    ///   - isDescriptionRequired: Whether a file request submitter is required to provide
    ///     a description of the files they are submitting.
    ///     
    ///     When this setting is set to true, the Box UI will show
    ///     a description field on the file request form.
    ///     
    ///     This defaults to setting of file request that was
    ///     copied to create this file request.
    ///   - expiresAt: The date after which a file request will no longer accept new
    ///     submissions.
    ///     
    ///     After this date, the `status` will automatically be set to
    ///     `inactive`.
    ///   - url: The generated URL for this file request. This URL can be shared
    ///     with users to let them upload files to the associated folder.
    ///   - etag: The HTTP `etag` of this file. This can be used in combination with
    ///     the `If-Match` header when updating a file request. By providing that
    ///     header, a change will only be performed on the  file request if the `etag`
    ///     on the file request still matches the `etag` provided in the `If-Match`
    ///     header.
    ///   - createdBy: 
    ///   - updatedBy: 
    public init(id: String, folder: FolderMini, createdAt: Date, updatedAt: Date, type: FileRequestTypeField = FileRequestTypeField.fileRequest, title: String? = nil, description: String? = nil, status: FileRequestStatusField? = nil, isEmailRequired: Bool? = nil, isDescriptionRequired: Bool? = nil, expiresAt: Date? = nil, url: String? = nil, etag: String? = nil, createdBy: UserMini? = nil, updatedBy: UserMini? = nil) {
        self.id = id
        self.folder = folder
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.type = type
        self.title = title
        self.description = description
        self.status = status
        self.isEmailRequired = isEmailRequired
        self.isDescriptionRequired = isDescriptionRequired
        self.expiresAt = expiresAt
        self.url = url
        self.etag = etag
        self.createdBy = createdBy
        self.updatedBy = updatedBy
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        folder = try container.decode(FolderMini.self, forKey: .folder)
        createdAt = try Utils.Dates.dateTimeFromString(dateTime: try container.decode(String.self, forKey: .createdAt))
        updatedAt = try Utils.Dates.dateTimeFromString(dateTime: try container.decode(String.self, forKey: .updatedAt))
        type = try container.decode(FileRequestTypeField.self, forKey: .type)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        status = try container.decodeIfPresent(FileRequestStatusField.self, forKey: .status)
        isEmailRequired = try container.decodeIfPresent(Bool.self, forKey: .isEmailRequired)
        isDescriptionRequired = try container.decodeIfPresent(Bool.self, forKey: .isDescriptionRequired)
        if let _expiresAt = try container.decodeIfPresent(String.self, forKey: .expiresAt) {
            expiresAt = try Utils.Dates.dateTimeFromString(dateTime: _expiresAt)
        } else {
            expiresAt = nil
        }

        url = try container.decodeIfPresent(String.self, forKey: .url)
        etag = try container.decodeIfPresent(String.self, forKey: .etag)
        createdBy = try container.decodeIfPresent(UserMini.self, forKey: .createdBy)
        updatedBy = try container.decodeIfPresent(UserMini.self, forKey: .updatedBy)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(folder, forKey: .folder)
        try container.encode(Utils.Dates.dateTimeToString(dateTime: createdAt), forKey: .createdAt)
        try container.encode(Utils.Dates.dateTimeToString(dateTime: updatedAt), forKey: .updatedAt)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(isEmailRequired, forKey: .isEmailRequired)
        try container.encodeIfPresent(isDescriptionRequired, forKey: .isDescriptionRequired)
        if let expiresAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: expiresAt), forKey: .expiresAt)
        }

        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(etag, forKey: .etag)
        try container.encodeIfPresent(createdBy, forKey: .createdBy)
        try container.encodeIfPresent(updatedBy, forKey: .updatedBy)
    }

}
