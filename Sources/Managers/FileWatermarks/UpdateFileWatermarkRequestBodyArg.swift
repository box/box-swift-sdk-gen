import Foundation

public class UpdateFileWatermarkRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case watermark
    }

    /// The watermark to imprint on the file
    public let watermark: UpdateFileWatermarkRequestBodyArgWatermarkField

    /// Initializer for a UpdateFileWatermarkRequestBodyArg.
    ///
    /// - Parameters:
    ///   - watermark: The watermark to imprint on the file
    public init(watermark: UpdateFileWatermarkRequestBodyArgWatermarkField) {
        self.watermark = watermark
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        watermark = try container.decode(UpdateFileWatermarkRequestBodyArgWatermarkField.self, forKey: .watermark)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(watermark, forKey: .watermark)
    }
}
