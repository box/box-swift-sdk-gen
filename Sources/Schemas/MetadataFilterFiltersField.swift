import Foundation

public enum MetadataFilterFiltersField: Codable {
    case metadataFieldFilterString(MetadataFieldFilterString)
    case metadataFieldFilterFloat(MetadataFieldFilterFloat)
    case metadataFieldFilterMultiSelect(MetadataFieldFilterMultiSelect)
    case metadataFieldFilterFloatRange(MetadataFieldFilterFloatRange)
    case metadataFieldFilterDateRange(MetadataFieldFilterDateRange)

    public init(from decoder: Decoder) throws {
        if let content = try? MetadataFieldFilterString(from: decoder) {
            self = .metadataFieldFilterString(content)
            return
        }

        if let content = try? MetadataFieldFilterFloat(from: decoder) {
            self = .metadataFieldFilterFloat(content)
            return
        }

        if let content = try? MetadataFieldFilterMultiSelect(from: decoder) {
            self = .metadataFieldFilterMultiSelect(content)
            return
        }

        if let content = try? MetadataFieldFilterFloatRange(from: decoder) {
            self = .metadataFieldFilterFloatRange(content)
            return
        }

        if let content = try? MetadataFieldFilterDateRange(from: decoder) {
            self = .metadataFieldFilterDateRange(content)
            return
        }

        throw DecodingError.typeMismatch(MetadataFilterFiltersField.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The type of the decoded object cannot be determined."))

    }

    public func encode(to encoder: Encoder) throws {
        switch self {
        case .metadataFieldFilterString(let metadataFieldFilterString):
            try metadataFieldFilterString.encode(to: encoder)
        case .metadataFieldFilterFloat(let metadataFieldFilterFloat):
            try metadataFieldFilterFloat.encode(to: encoder)
        case .metadataFieldFilterMultiSelect(let metadataFieldFilterMultiSelect):
            try metadataFieldFilterMultiSelect.encode(to: encoder)
        case .metadataFieldFilterFloatRange(let metadataFieldFilterFloatRange):
            try metadataFieldFilterFloatRange.encode(to: encoder)
        case .metadataFieldFilterDateRange(let metadataFieldFilterDateRange):
            try metadataFieldFilterDateRange.encode(to: encoder)
        }
    }

}
