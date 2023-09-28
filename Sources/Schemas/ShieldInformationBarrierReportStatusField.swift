import Foundation

public enum ShieldInformationBarrierReportStatusField: String, CodableStringEnum {
    case pending = "pending"
    case error = "error"
    case done = "done"
    case cancelled = "cancelled"
}
