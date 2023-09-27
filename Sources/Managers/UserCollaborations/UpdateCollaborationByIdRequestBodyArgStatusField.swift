import Foundation

public enum UpdateCollaborationByIdRequestBodyArgStatusField: String, CodableStringEnum {
    case pending = "pending"
    case accepted = "accepted"
    case rejected = "rejected"
}
