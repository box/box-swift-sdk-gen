import Foundation

public enum TemplateSignerInputTypeField: String, CodableStringEnum {
    case signature
    case date
    case text
    case checkbox
    case attachment
    case radio
    case dropdown
}
