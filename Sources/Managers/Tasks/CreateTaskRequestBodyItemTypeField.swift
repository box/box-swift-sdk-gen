import Foundation

public enum CreateTaskRequestBodyItemTypeField: CodableStringEnum {
    case file
    case customValue(String)

    public init(rawValue value: String) {
        switch value.lowercased() {
        case "file".lowercased():
            self = .file
        default:
            self = .customValue(value)
        }
    }

    public var rawValue: String {
        switch self {
        case .file:
            return "file"
        case .customValue(let value):
            return value
        }
    }

}
