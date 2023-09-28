import Foundation

public enum MetadataCascadePolicyScopeField: String, CodableStringEnum {
    case global = "global"
    case enterprise = "enterprise_*"
}
