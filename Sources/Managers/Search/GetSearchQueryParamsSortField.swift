import Foundation

public enum GetSearchQueryParamsSortField: String, CodableStringEnum {
    case modifiedAt = "modified_at"
    case relevance
}
