import Foundation

/// The bare basic representation of a file, the minimal
/// amount of fields returned when using the `fields` query
/// parameter.
public class FileBase: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case etag
    }

    /// The unique identifier that represent a file.
    /// 
    /// The ID for any file can be determined
    /// by visiting a file in the web application
    /// and copying the ID from the URL. For example,
    /// for the URL `https://*.app.box.com/files/123`
    /// the `file_id` is `123`.
    public let id: String
    /// `file`
    public let type: FileBaseTypeField
    /// The HTTP `etag` of this file. This can be used within some API
    /// endpoints in the `If-Match` and `If-None-Match` headers to only
    /// perform changes on the file if (no) changes have happened.
    public let etag: String?

    /// Initializer for a FileBase.
    ///
    /// - Parameters:
    ///   - id: The unique identifier that represent a file.
    ///     
    ///     The ID for any file can be determined
    ///     by visiting a file in the web application
    ///     and copying the ID from the URL. For example,
    ///     for the URL `https://*.app.box.com/files/123`
    ///     the `file_id` is `123`.
    ///   - type: `file`
    ///   - etag: The HTTP `etag` of this file. This can be used within some API
    ///     endpoints in the `If-Match` and `If-None-Match` headers to only
    ///     perform changes on the file if (no) changes have happened.
    public init(id: String, type: FileBaseTypeField, etag: String? = nil) {
        self.id = id
        self.type = type
        self.etag = etag
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        type = try container.decode(FileBaseTypeField.self, forKey: .type)
        etag = try container.decodeIfPresent(String.self, forKey: .etag)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(etag, forKey: .etag)
    }
}
