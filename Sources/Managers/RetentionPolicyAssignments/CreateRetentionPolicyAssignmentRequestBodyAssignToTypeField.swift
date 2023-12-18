import Foundation

public enum CreateRetentionPolicyAssignmentRequestBodyAssignToTypeField: String, CodableStringEnum {
    case enterprise
    case folder
    case metadataTemplate = "metadata_template"
}
