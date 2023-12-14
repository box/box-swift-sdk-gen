import Foundation

public enum GetSearchQueryParamsTypeField: String, CodableStringEnum {
    case file
    case folder
    case webLink = "web_link"
}
