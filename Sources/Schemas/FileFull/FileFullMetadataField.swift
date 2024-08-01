import Foundation

public class FileFullMetadataField: Codable {
    private struct CodingKeys: CodingKey {

        var intValue: Int?

        var stringValue: String

        init?(intValue: Int) {
            return nil
        }

        init(stringValue: String) {
            self.stringValue = stringValue
        }

    }

    public let extraData: [String: [String: Metadata]]?

    public init(extraData: [String: [String: Metadata]]? = nil) {
        self.extraData = extraData
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let allKeys: [CodingKeys] = container.allKeys
        let definedKeys: [CodingKeys] = []
        let additionalKeys: [CodingKeys] = allKeys.filter({ (parent: CodingKeys) in !definedKeys.contains(where: { (child: CodingKeys) in child.stringValue == parent.stringValue }) })

        if !additionalKeys.isEmpty {
            var additionalProperties: [String: [String: Metadata]] = [:]
            for key in additionalKeys {
                if let value = try? container.decode([String: Metadata].self, forKey: key) {
                    additionalProperties[key.stringValue] = value
                }

            }

            extraData = additionalProperties
        } else {
            extraData = nil
        }

    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        if let extraData = extraData {
            for (key,value) in extraData {
                try container.encodeIfPresent(value, forKey: CodingKeys(stringValue: key))
            }

        }

    }

}
