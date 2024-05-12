import Foundation

public enum MetadataFilterScopeField: String, CodableStringEnum {
    case global
    case enterprise
    case enterpriseEnterpriseId = "enterprise_{enterprise_id}"
}
