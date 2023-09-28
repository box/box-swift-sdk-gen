import Foundation

public enum UpdateFolderMetadataByIdRequestBodyArgOpField: String, CodableStringEnum {
    case add = "add"
    case replace = "replace"
    case remove = "remove"
    case test = "test"
    case move = "move"
    case copy = "copy"
}
