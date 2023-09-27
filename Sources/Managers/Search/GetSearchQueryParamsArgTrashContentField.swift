import Foundation

public enum GetSearchQueryParamsArgTrashContentField: String, CodableStringEnum {
    case nonTrashedOnly = "non_trashed_only"
    case trashedOnly = "trashed_only"
    case allItems = "all_items"
}
