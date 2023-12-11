import Foundation

public class FileFullRepresentationsField: Codable {
    private enum CodingKeys: String, CodingKey {
        case entries
    }

    /// A list of files
    public let entries: [FileFullRepresentationsFieldEntriesField]?

    /// Initializer for a FileFullRepresentationsField.
    ///
    /// - Parameters:
    ///   - entries: A list of files
    public init(entries: [FileFullRepresentationsFieldEntriesField]? = nil) {
        self.entries = entries
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        entries = try container.decodeIfPresent([FileFullRepresentationsFieldEntriesField].self, forKey: .entries)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(entries, forKey: .entries)
    }

}
