import Foundation

public enum UpdateMetadataTemplateSchemaRequestBodyArgOpField: String, CodableStringEnum {
    case editTemplate = "editTemplate"
    case addField = "addField"
    case reorderFields = "reorderFields"
    case addEnumOption = "addEnumOption"
    case reorderEnumOptions = "reorderEnumOptions"
    case reorderMultiSelectOptions = "reorderMultiSelectOptions"
    case addMultiSelectOption = "addMultiSelectOption"
    case editField = "editField"
    case removeField = "removeField"
    case editEnumOption = "editEnumOption"
    case removeEnumOption = "removeEnumOption"
    case editMultiSelectOption = "editMultiSelectOption"
    case removeMultiSelectOption = "removeMultiSelectOption"
}
