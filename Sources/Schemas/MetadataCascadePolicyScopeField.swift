import Foundation

public enum MetadataCascadePolicyScopeField: String, CodableStringEnum {
    case global
    case enterprise = "enterprise_*"
}
