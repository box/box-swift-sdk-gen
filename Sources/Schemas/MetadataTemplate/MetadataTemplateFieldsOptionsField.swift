import Foundation

public class MetadataTemplateFieldsOptionsField: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case key
        case id
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// The text value of the option. This represents both the display name of the
    /// option and the internal key used when updating templates.
    public let key: String

    /// The internal unique identifier of the the option.
    public let id: String?

    /// Initializer for a MetadataTemplateFieldsOptionsField.
    ///
    /// - Parameters:
    ///   - key: The text value of the option. This represents both the display name of the
    ///     option and the internal key used when updating templates.
    ///   - id: The internal unique identifier of the the option.
    public init(key: String, id: String? = nil) {
        self.key = key
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        key = try container.decode(String.self, forKey: .key)
        id = try container.decodeIfPresent(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(key, forKey: .key)
        try container.encodeIfPresent(id, forKey: .id)
    }

    /// Sets the raw JSON data.
    ///
    /// - Parameters:
    ///   - rawData: A dictionary containing the raw JSON data
    func setRawData(rawData: [String: Any]?) {
        self._rawData = rawData
    }

    /// Gets the raw JSON data
    /// - Returns: The `[String: Any]?`.
    func getRawData() -> [String: Any]? {
        return self._rawData
    }

}
