import Foundation

/// The schema for for creating a Box Doc Gen job request.
public class DocGenDocumentGenerationDataV2025R0: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case generatedFileName = "generated_file_name"
        case userInput = "user_input"
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// File name of the output file.
    public let generatedFileName: String

    public let userInput: [String: AnyCodable]

    /// Initializer for a DocGenDocumentGenerationDataV2025R0.
    ///
    /// - Parameters:
    ///   - generatedFileName: File name of the output file.
    ///   - userInput: 
    public init(generatedFileName: String, userInput: [String: AnyCodable]) {
        self.generatedFileName = generatedFileName
        self.userInput = userInput
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        generatedFileName = try container.decode(String.self, forKey: .generatedFileName)
        userInput = try container.decode([String: AnyCodable].self, forKey: .userInput)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(generatedFileName, forKey: .generatedFileName)
        try container.encode(userInput, forKey: .userInput)
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
