import Foundation

public enum DocGenTagV2025R0TagTypeField: String, CodableStringEnum {
    case text
    case arithmetic
    case conditional
    case forLoop = "for-loop"
    case tableLoop = "table-loop"
    case image
}
