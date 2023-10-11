import Foundation

public class FileFullRepresentationsFieldEntriesField: Codable {
    private enum CodingKeys: String, CodingKey {
        case content
        case info
        case properties
        case representation
        case status
    }

    /// An object containing the URL that can be used to actually fetch
    /// the representation.
    public let content: FileFullRepresentationsFieldEntriesFieldContentField?
    /// An object containing the URL that can be used to fetch more info
    /// on this representation.
    public let info: FileFullRepresentationsFieldEntriesFieldInfoField?
    /// An object containing the size and type of this presentation.
    public let properties: FileFullRepresentationsFieldEntriesFieldPropertiesField?
    /// Indicates the file type of the returned representation.
    public let representation: String?
    /// An object containing the status of this representation.
    public let status: FileFullRepresentationsFieldEntriesFieldStatusField?

    /// Initializer for a FileFullRepresentationsFieldEntriesField.
    ///
    /// - Parameters:
    ///   - content: An object containing the URL that can be used to actually fetch
    ///     the representation.
    ///   - info: An object containing the URL that can be used to fetch more info
    ///     on this representation.
    ///   - properties: An object containing the size and type of this presentation.
    ///   - representation: Indicates the file type of the returned representation.
    ///   - status: An object containing the status of this representation.
    public init(content: FileFullRepresentationsFieldEntriesFieldContentField? = nil, info: FileFullRepresentationsFieldEntriesFieldInfoField? = nil, properties: FileFullRepresentationsFieldEntriesFieldPropertiesField? = nil, representation: String? = nil, status: FileFullRepresentationsFieldEntriesFieldStatusField? = nil) {
        self.content = content
        self.info = info
        self.properties = properties
        self.representation = representation
        self.status = status
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        content = try container.decodeIfPresent(FileFullRepresentationsFieldEntriesFieldContentField.self, forKey: .content)
        info = try container.decodeIfPresent(FileFullRepresentationsFieldEntriesFieldInfoField.self, forKey: .info)
        properties = try container.decodeIfPresent(FileFullRepresentationsFieldEntriesFieldPropertiesField.self, forKey: .properties)
        representation = try container.decodeIfPresent(String.self, forKey: .representation)
        status = try container.decodeIfPresent(FileFullRepresentationsFieldEntriesFieldStatusField.self, forKey: .status)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(content, forKey: .content)
        try container.encodeIfPresent(info, forKey: .info)
        try container.encodeIfPresent(properties, forKey: .properties)
        try container.encodeIfPresent(representation, forKey: .representation)
        try container.encodeIfPresent(status, forKey: .status)
    }
}
