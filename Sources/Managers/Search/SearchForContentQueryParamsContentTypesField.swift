import Foundation

public enum SearchForContentQueryParamsContentTypesField: String, CodableStringEnum {
    case name
    case description
    case fileContent = "file_content"
    case comments
    case tag
}
