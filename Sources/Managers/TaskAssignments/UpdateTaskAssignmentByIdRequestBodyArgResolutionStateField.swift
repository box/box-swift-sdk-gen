import Foundation

public enum UpdateTaskAssignmentByIdRequestBodyArgResolutionStateField: String, CodableStringEnum {
    case completed = "completed"
    case incomplete = "incomplete"
    case approved = "approved"
    case rejected = "rejected"
}
