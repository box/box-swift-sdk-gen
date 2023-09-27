import Foundation

public class Watermark: Codable {
    private enum CodingKeys: String, CodingKey {
        case watermark
    }

    public let watermark: WatermarkWatermarkField?

    public init(watermark: WatermarkWatermarkField? = nil) {
        self.watermark = watermark
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        watermark = try container.decodeIfPresent(WatermarkWatermarkField.self, forKey: .watermark)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(watermark, forKey: .watermark)
    }
}
