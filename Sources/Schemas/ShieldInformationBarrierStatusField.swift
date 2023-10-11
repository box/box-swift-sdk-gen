import Foundation

public enum ShieldInformationBarrierStatusField: String, CodableStringEnum {
    case draft
    case pending
    case disabled
    case enabled
    case invalid
}
