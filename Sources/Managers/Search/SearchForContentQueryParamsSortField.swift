import Foundation

public enum SearchForContentQueryParamsSortField: String, CodableStringEnum {
    case modifiedAt = "modified_at"
    case relevance
}
