import Foundation

public enum GetUsersQueryParamsArgUserTypeField: String, CodableStringEnum {
    case all = "all"
    case managed = "managed"
    case external = "external"
}
