import Foundation

public enum CollaborationAllowlistEntryDirectionField: String, CodableStringEnum {
    case inbound = "inbound"
    case outbound = "outbound"
    case both = "both"
}
