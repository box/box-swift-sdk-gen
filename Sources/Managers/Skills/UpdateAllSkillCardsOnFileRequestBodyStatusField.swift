import Foundation

public enum UpdateAllSkillCardsOnFileRequestBodyStatusField: String, CodableStringEnum {
    case invoked
    case processing
    case success
    case transientFailure = "transient_failure"
    case permanentFailure = "permanent_failure"
}
