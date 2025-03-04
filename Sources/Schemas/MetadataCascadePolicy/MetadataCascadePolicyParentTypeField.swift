import Foundation

public enum MetadataCascadePolicyParentTypeField: CodableStringEnum {
    case folder
    case customValue(String)

    public init(rawValue value: String) {
        switch value.lowercased() {
        case "folder".lowercased():
            self = .folder
        default:
            self = .customValue(value)
        }
    }

    public var rawValue: String {
        switch self {
        case .folder:
            return "folder"
        case .customValue(let value):
            return value
        }
    }

}
