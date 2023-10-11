import Foundation

public class UpdateShieldInformationBarrierSegmentByIdRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case name
        case description
    }

    /// The updated name for the shield information barrier segment.
    public let name: String?
    /// The updated description for
    /// the shield information barrier segment.
    public let description: String?

    /// Initializer for a UpdateShieldInformationBarrierSegmentByIdRequestBodyArg.
    ///
    /// - Parameters:
    ///   - name: The updated name for the shield information barrier segment.
    ///   - description: The updated description for
    ///     the shield information barrier segment.
    public init(name: String? = nil, description: String? = nil) {
        self.name = name
        self.description = description
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(description, forKey: .description)
    }
}
