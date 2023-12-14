import Foundation

public enum CreateRetentionPolicyRequestBodyDispositionActionField: String, CodableStringEnum {
    case permanentlyDelete = "permanently_delete"
    case removeRetention = "remove_retention"
}
