import Foundation

public enum GetFileVersionRetentionsQueryParamsArgDispositionActionField: String, CodableStringEnum {
    case permanentlyDelete = "permanently_delete"
    case removeRetention = "remove_retention"
}
