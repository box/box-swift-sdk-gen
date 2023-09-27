import Foundation

public enum CreateRetentionPolicyRequestBodyArgDispositionActionField: String, CodableStringEnum {
    case permanentlyDelete = "permanently_delete"
    case removeRetention = "remove_retention"
}
