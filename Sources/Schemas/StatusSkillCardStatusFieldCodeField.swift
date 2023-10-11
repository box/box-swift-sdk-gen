import Foundation

public enum StatusSkillCardStatusFieldCodeField: String, CodableStringEnum {
    case invoked
    case processing
    case success
    case transientFailure = "transient_failure"
    case permanentFailure = "permanent_failure"
}
