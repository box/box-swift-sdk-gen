import Foundation

public enum GroupBaseV2025R0TypeField: CodableStringEnum {
    case group
    case customValue(String)

    public init(rawValue value: String) {
        switch value.lowercased() {
        case "group".lowercased():
            self = .group
        default:
            self = .customValue(value)
        }
    }

    public var rawValue: String {
        switch self {
        case .group:
            return "group"
        case .customValue(let value):
            return value
        }
    }

}
