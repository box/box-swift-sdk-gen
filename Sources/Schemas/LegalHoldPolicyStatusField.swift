import Foundation

public enum LegalHoldPolicyStatusField: String, CodableStringEnum {
    case active = "active"
    case applying = "applying"
    case releasing = "releasing"
    case released = "released"
}
