import Foundation

public enum TrashWebLinkItemStatusField: String, CodableStringEnum {
    case active = "active"
    case trashed = "trashed"
    case deleted = "deleted"
}
