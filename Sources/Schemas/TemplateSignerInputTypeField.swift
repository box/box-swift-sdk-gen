import Foundation

public enum TemplateSignerInputTypeField: String, CodableStringEnum {
    case signature = "signature"
    case date = "date"
    case text = "text"
    case checkbox = "checkbox"
    case attachment = "attachment"
    case radio = "radio"
    case dropdown = "dropdown"
}
