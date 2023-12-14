import Foundation

public enum UpdateMetadataTemplateRequestBodyOpField: String, CodableStringEnum {
    case editTemplate
    case addField
    case reorderFields
    case addEnumOption
    case reorderEnumOptions
    case reorderMultiSelectOptions
    case addMultiSelectOption
    case editField
    case removeField
    case editEnumOption
    case removeEnumOption
    case editMultiSelectOption
    case removeMultiSelectOption
}
