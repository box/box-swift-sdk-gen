import Foundation

public enum FolderSharedLinkEffectivePermissionField: String, CodableStringEnum {
    case canEdit = "can_edit"
    case canDownload = "can_download"
    case canPreview = "can_preview"
    case noAccess = "no_access"
}
