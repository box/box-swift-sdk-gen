import Foundation

public enum GetFileVersionRetentionsQueryParamsDispositionActionField: String, CodableStringEnum {
    case permanentlyDelete = "permanently_delete"
    case removeRetention = "remove_retention"
}
