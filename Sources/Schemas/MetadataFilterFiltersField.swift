import Foundation

public enum MetadataFilterFiltersField: Codable {
    case metadataFieldFilterString(MetadataFieldFilterString)
    case metadataFieldFilterFloat(MetadataFieldFilterFloat)
    case metadataFieldFilterMultiSelect(MetadataFieldFilterMultiSelect)
    case metadataFieldFilterFloatRange(MetadataFieldFilterFloatRange)
    case metadataFieldFilterDateRange(MetadataFieldFilterDateRange)

    public init(from decoder: Decoder) throws {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "The rules determining the decoding cannot be established."))
    }

    public func encode(to encoder: Encoder) throws {
        throw EncodingError.invalidValue(MetadataFilterFiltersField.self, EncodingError.Context(codingPath: [], debugDescription: "The rules determining the encoding cannot be established."))
    }

}
