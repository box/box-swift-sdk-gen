import Foundation

public enum DocGenJobV2025R0StatusField: String, CodableStringEnum {
    case submitted
    case completed
    case failed
    case completedWithError = "completed_with_error"
    case pending
}
