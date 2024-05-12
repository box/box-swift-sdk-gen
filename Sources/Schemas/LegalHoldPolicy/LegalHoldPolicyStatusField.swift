import Foundation

public enum LegalHoldPolicyStatusField: String, CodableStringEnum {
    case active
    case applying
    case releasing
    case released
}
