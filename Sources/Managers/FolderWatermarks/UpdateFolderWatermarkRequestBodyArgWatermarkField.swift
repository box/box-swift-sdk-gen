import Foundation

public class UpdateFolderWatermarkRequestBodyArgWatermarkField: Codable {
    private enum CodingKeys: String, CodingKey {
        case imprint
    }

    /// The type of watermark to apply.
    /// 
    /// Currently only supports one option.,
    public let imprint: UpdateFolderWatermarkRequestBodyArgWatermarkFieldImprintField

    /// Initializer for a UpdateFolderWatermarkRequestBodyArgWatermarkField.
    ///
    /// - Parameters:
    ///   - imprint: The type of watermark to apply.
    ///     
    ///     Currently only supports one option.
    public init(imprint: UpdateFolderWatermarkRequestBodyArgWatermarkFieldImprintField) {
        self.imprint = imprint
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        imprint = try container.decode(UpdateFolderWatermarkRequestBodyArgWatermarkFieldImprintField.self, forKey: .imprint)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(imprint, forKey: .imprint)
    }
}
