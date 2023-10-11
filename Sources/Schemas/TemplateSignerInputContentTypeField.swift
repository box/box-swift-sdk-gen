import Foundation

public enum TemplateSignerInputContentTypeField: String, CodableStringEnum {
    case signature
    case initial
    case stamp
    case date
    case checkbox
    case text
    case fullName = "full_name"
    case firstName = "first_name"
    case lastName = "last_name"
    case company
    case title
    case email
    case attachment
    case radio
    case dropdown
}
