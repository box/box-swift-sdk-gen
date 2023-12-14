import Foundation

public enum UpdateFileMetadataByIdRequestBodyOpField: String, CodableStringEnum {
    case add
    case replace
    case remove
    case test
    case move
    case copy
}
