import Foundation

/// A Box Doc Gen template object.
public class DocGenTemplateV2025R0: DocGenTemplateBaseV2025R0 {
    private enum CodingKeys: String, CodingKey {
        case fileName = "file_name"
    }

    /// The name of the template
    public let fileName: String?

    /// Initializer for a DocGenTemplateV2025R0.
    ///
    /// - Parameters:
    ///   - file: 
    ///   - fileName: The name of the template
    public init(file: FileReferenceV2025R0? = nil, fileName: String? = nil) {
        self.fileName = fileName

        super.init(file: file)
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fileName = try container.decodeIfPresent(String.self, forKey: .fileName)

        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(fileName, forKey: .fileName)
        try super.encode(to: encoder)
    }

}
