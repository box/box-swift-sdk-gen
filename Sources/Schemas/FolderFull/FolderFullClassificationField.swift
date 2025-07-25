import Foundation

public class FolderFullClassificationField: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case name
        case definition
        case color
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// The name of the classification.
    public let name: String?

    /// An explanation of the meaning of this classification.
    public let definition: String?

    /// The color that is used to display the
    /// classification label in a user-interface. Colors are defined by the admin
    /// or co-admin who created the classification in the Box web app.
    public let color: String?

    /// Initializer for a FolderFullClassificationField.
    ///
    /// - Parameters:
    ///   - name: The name of the classification.
    ///   - definition: An explanation of the meaning of this classification.
    ///   - color: The color that is used to display the
    ///     classification label in a user-interface. Colors are defined by the admin
    ///     or co-admin who created the classification in the Box web app.
    public init(name: String? = nil, definition: String? = nil, color: String? = nil) {
        self.name = name
        self.definition = definition
        self.color = color
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        definition = try container.decodeIfPresent(String.self, forKey: .definition)
        color = try container.decodeIfPresent(String.self, forKey: .color)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(definition, forKey: .definition)
        try container.encodeIfPresent(color, forKey: .color)
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
