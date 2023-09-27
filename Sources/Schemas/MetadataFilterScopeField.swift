import Foundation

public enum MetadataFilterScopeField: String, CodableStringEnum {
    case global = "global"
    case enterprise = "enterprise"
    case enterpriseEnterpriseId = "enterprise_{enterprise_id}"
}
