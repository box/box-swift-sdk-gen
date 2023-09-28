import Foundation

public enum TrashWebLinkRestoredItemStatusField: String, CodableStringEnum {
    case active = "active"
    case trashed = "trashed"
    case deleted = "deleted"
}
