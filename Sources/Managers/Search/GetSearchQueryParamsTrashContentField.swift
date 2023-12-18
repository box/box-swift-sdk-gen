import Foundation

public enum GetSearchQueryParamsTrashContentField: String, CodableStringEnum {
    case nonTrashedOnly = "non_trashed_only"
    case trashedOnly = "trashed_only"
    case allItems = "all_items"
}
