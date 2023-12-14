import Foundation

public enum GetLegalHoldPolicyAssignmentsQueryParamsAssignToTypeField: String, CodableStringEnum {
    case file
    case fileVersion = "file_version"
    case folder
    case user
}
