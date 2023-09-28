import Foundation

public enum TrashFileRestoredItemStatusField: String, CodableStringEnum {
    case active = "active"
    case trashed = "trashed"
    case deleted = "deleted"
}
