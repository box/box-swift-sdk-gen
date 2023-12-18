import Foundation

public enum MetadataTemplateFieldsTypeField: String, CodableStringEnum {
    case string
    case float
    case date
    case enum_ = "enum"
    case multiSelect
    case integer
}
