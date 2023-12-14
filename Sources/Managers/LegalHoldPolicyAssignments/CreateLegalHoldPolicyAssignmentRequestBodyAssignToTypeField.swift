import Foundation

public enum CreateLegalHoldPolicyAssignmentRequestBodyAssignToTypeField: String, CodableStringEnum {
    case file
    case fileVersion = "file_version"
    case folder
    case user
}
