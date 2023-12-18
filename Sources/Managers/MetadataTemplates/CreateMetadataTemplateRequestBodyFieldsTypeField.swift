import Foundation

public enum CreateMetadataTemplateRequestBodyFieldsTypeField: String, CodableStringEnum {
    case string
    case float
    case date
    case enum_ = "enum"
    case multiSelect
}
