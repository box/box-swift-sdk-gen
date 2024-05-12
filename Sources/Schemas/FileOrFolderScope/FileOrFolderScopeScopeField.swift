import Foundation

public enum FileOrFolderScopeScopeField: String, CodableStringEnum {
    case annotationEdit = "annotation_edit"
    case annotationViewAll = "annotation_view_all"
    case annotationViewSelf = "annotation_view_self"
    case baseExplorer = "base_explorer"
    case basePicker = "base_picker"
    case basePreview = "base_preview"
    case baseUpload = "base_upload"
    case itemDelete = "item_delete"
    case itemDownload = "item_download"
    case itemPreview = "item_preview"
    case itemRename = "item_rename"
    case itemShare = "item_share"
}
