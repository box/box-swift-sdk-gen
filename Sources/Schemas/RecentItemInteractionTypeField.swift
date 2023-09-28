import Foundation

public enum RecentItemInteractionTypeField: String, CodableStringEnum {
    case itemPreview = "item_preview"
    case itemUpload = "item_upload"
    case itemComment = "item_comment"
    case itemOpen = "item_open"
    case itemModify = "item_modify"
}
