import Foundation

public enum SignRequestSignerInputTypeField: String, CodableStringEnum {
    case signature
    case date
    case text
    case checkbox
    case radio
    case dropdown
}
