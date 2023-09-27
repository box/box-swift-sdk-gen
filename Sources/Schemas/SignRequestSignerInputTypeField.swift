import Foundation

public enum SignRequestSignerInputTypeField: String, CodableStringEnum {
    case signature = "signature"
    case date = "date"
    case text = "text"
    case checkbox = "checkbox"
}
