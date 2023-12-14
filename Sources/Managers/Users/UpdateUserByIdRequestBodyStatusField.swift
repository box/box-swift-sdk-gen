import Foundation

public enum UpdateUserByIdRequestBodyStatusField: String, CodableStringEnum {
    case active
    case inactive
    case cannotDeleteEdit = "cannot_delete_edit"
    case cannotDeleteEditUpload = "cannot_delete_edit_upload"
}
