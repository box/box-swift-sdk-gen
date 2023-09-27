import Foundation

public enum RetentionPolicyMiniDispositionActionField: String, CodableStringEnum {
    case permanentlyDelete = "permanently_delete"
    case removeRetention = "remove_retention"
}
