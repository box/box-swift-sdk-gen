import Foundation

public class UpdateFolderWatermarkRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case watermark
    }

    /// The watermark to imprint on the folder,
    public let watermark: UpdateFolderWatermarkRequestBodyArgWatermarkField

    /// Initializer for a UpdateFolderWatermarkRequestBodyArg.
    ///
    /// - Parameters:
    ///   - watermark: The watermark to imprint on the folder
    public init(watermark: UpdateFolderWatermarkRequestBodyArgWatermarkField) {
        self.watermark = watermark
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        watermark = try container.decode(UpdateFolderWatermarkRequestBodyArgWatermarkField.self, forKey: .watermark)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(watermark, forKey: .watermark)
    }
}
