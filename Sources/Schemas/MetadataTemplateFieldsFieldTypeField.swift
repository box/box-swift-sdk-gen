import Foundation

public enum MetadataTemplateFieldsFieldTypeField: String, CodableStringEnum {
    case string = "string"
    case float = "float"
    case date = "date"
    case enum_ = "enum"
    case multiSelect = "multiSelect"
    case integer = "integer"
}
