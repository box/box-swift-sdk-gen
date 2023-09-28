import Foundation

public enum TrashFolderItemStatusField: String, CodableStringEnum {
    case active = "active"
    case trashed = "trashed"
    case deleted = "deleted"
}
