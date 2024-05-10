import Foundation

public enum TaskAssignmentResolutionStateField: String, CodableStringEnum {
    case completed
    case incomplete
    case approved
    case rejected
}
