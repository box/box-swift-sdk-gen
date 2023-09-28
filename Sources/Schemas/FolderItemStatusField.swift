import Foundation

public enum FolderItemStatusField: String, CodableStringEnum {
    case active = "active"
    case trashed = "trashed"
    case deleted = "deleted"
}
