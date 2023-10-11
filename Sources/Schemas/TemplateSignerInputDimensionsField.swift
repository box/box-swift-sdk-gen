import Foundation

public class TemplateSignerInputDimensionsField: Codable {
    private enum CodingKeys: String, CodingKey {
        case width
        case height
    }

    /// Relative width to the page the input is on, ranging from 0 to 1.
    public let width: Int?
    /// Relative height to the page the input is on, ranging from 0 to 1.
    public let height: Int?

    /// Initializer for a TemplateSignerInputDimensionsField.
    ///
    /// - Parameters:
    ///   - width: Relative width to the page the input is on, ranging from 0 to 1.
    ///   - height: Relative height to the page the input is on, ranging from 0 to 1.
    public init(width: Int? = nil, height: Int? = nil) {
        self.width = width
        self.height = height
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        width = try container.decodeIfPresent(Int.self, forKey: .width)
        height = try container.decodeIfPresent(Int.self, forKey: .height)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(width, forKey: .width)
        try container.encodeIfPresent(height, forKey: .height)
    }
}
