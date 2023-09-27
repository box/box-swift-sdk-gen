import Foundation

public enum ShieldInformationBarrierStatusField: String, CodableStringEnum {
    case draft = "draft"
    case pending = "pending"
    case disabled = "disabled"
    case enabled = "enabled"
    case invalid = "invalid"
}
