import Foundation

public enum UpdateFileMetadataByIdRequestBodyArgOpField: String, CodableStringEnum {
    case add
    case replace
    case remove
    case test
    case move
    case copy
}
