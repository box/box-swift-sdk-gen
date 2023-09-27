import Foundation

public enum TemplateSignerInputContentTypeField: String, CodableStringEnum {
    case signature = "signature"
    case initial = "initial"
    case stamp = "stamp"
    case date = "date"
    case checkbox = "checkbox"
    case text = "text"
    case fullName = "full_name"
    case firstName = "first_name"
    case lastName = "last_name"
    case company = "company"
    case title = "title"
    case email = "email"
    case attachment = "attachment"
    case radio = "radio"
    case dropdown = "dropdown"
}
