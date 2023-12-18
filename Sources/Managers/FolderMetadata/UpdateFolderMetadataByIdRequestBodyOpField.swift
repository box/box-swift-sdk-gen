import Foundation

public enum UpdateFolderMetadataByIdRequestBodyOpField: String, CodableStringEnum {
    case add
    case replace
    case remove
    case test
    case move
    case copy
}
