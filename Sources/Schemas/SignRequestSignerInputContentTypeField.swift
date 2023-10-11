import Foundation

public enum SignRequestSignerInputContentTypeField: String, CodableStringEnum {
    case initial
    case stamp
    case signature
    case company
    case title
    case email
    case fullName = "full_name"
    case firstName = "first_name"
    case lastName = "last_name"
    case text
    case date
    case checkbox
    case attachment
}
