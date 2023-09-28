import Foundation

public enum SkillInvocationStatusFieldStateField: String, CodableStringEnum {
    case invoked = "invoked"
    case processing = "processing"
    case success = "success"
    case transientFailure = "transient_failure"
    case permanentFailure = "permanent_failure"
}
