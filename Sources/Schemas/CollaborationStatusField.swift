import Foundation

public enum CollaborationStatusField: String, CodableStringEnum {
    case accepted = "accepted"
    case pending = "pending"
    case rejected = "rejected"
}
