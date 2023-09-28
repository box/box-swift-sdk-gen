import Foundation

public enum StatusSkillCardStatusFieldCodeField: String, CodableStringEnum {
    case invoked = "invoked"
    case processing = "processing"
    case success = "success"
    case transientFailure = "transient_failure"
    case permanentFailure = "permanent_failure"
}
