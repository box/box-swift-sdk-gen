import Foundation

public class FileFullMetadataField: Codable {
    private enum CodingKeys: String, CodingKey {
        case extraData
    }

    public let extraData: [String: [String: Metadata]]?

    public init(extraData: [String: [String: Metadata]]? = nil) {
        self.extraData = extraData
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        extraData = try container.decodeIfPresent([String: [String: Metadata]].self, forKey: .extraData)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(extraData, forKey: .extraData)
    }
}
