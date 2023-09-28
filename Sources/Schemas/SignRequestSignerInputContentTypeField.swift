import Foundation

public enum SignRequestSignerInputContentTypeField: String, CodableStringEnum {
    case initial = "initial"
    case stamp = "stamp"
    case signature = "signature"
    case company = "company"
    case title = "title"
    case email = "email"
    case fullName = "full_name"
    case firstName = "first_name"
    case lastName = "last_name"
    case text = "text"
    case date = "date"
    case checkbox = "checkbox"
    case attachment = "attachment"
}
