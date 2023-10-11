import Foundation

public enum GetLegalHoldPolicyAssignmentsQueryParamsArgAssignToTypeField: String, CodableStringEnum {
    case file
    case fileVersion = "file_version"
    case folder
    case user
}
