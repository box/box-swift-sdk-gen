import Foundation

public enum ShieldInformationBarrierReportStatusField: String, CodableStringEnum {
    case pending
    case error
    case done
    case cancelled
}
