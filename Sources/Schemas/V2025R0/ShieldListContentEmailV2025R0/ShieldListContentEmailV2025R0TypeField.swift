import Foundation

public enum ShieldListContentEmailV2025R0TypeField: CodableStringEnum {
    case email
    case customValue(String)

    public init(rawValue value: String) {
        switch value.lowercased() {
        case "email".lowercased():
            self = .email
        default:
            self = .customValue(value)
        }
    }

    public var rawValue: String {
        switch self {
        case .email:
            return "email"
        case .customValue(let value):
            return value
        }
    }

}
