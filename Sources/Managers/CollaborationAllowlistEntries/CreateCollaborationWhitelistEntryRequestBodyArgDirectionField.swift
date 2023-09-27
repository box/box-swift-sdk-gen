import Foundation

public enum CreateCollaborationWhitelistEntryRequestBodyArgDirectionField: String, CodableStringEnum {
    case inbound = "inbound"
    case outbound = "outbound"
    case both = "both"
}
