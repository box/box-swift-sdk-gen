import Foundation

public enum SearchForContentQueryParamsTypeField: String, CodableStringEnum {
    case file
    case folder
    case webLink = "web_link"
}
