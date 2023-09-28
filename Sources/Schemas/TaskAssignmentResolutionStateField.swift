import Foundation

public enum TaskAssignmentResolutionStateField: String, CodableStringEnum {
    case completed = "completed"
    case incomplete = "incomplete"
    case approved = "approved"
    case rejected = "rejected"
}
