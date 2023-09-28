import Foundation

public enum UserStatusField: String, CodableStringEnum {
    case active = "active"
    case inactive = "inactive"
    case cannotDeleteEdit = "cannot_delete_edit"
    case cannotDeleteEditUpload = "cannot_delete_edit_upload"
}
