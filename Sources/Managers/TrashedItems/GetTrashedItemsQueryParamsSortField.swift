import Foundation

public enum GetTrashedItemsQueryParamsSortField: CodableStringEnum {
    case name
    case date
    case size
    case customValue(String)

    public init(rawValue value: String) {
        switch value.lowercased() {
        case "name".lowercased():
            self = .name
        case "date".lowercased():
            self = .date
        case "size".lowercased():
            self = .size
        default:
            self = .customValue(value)
        }
    }

    public var rawValue: String {
        switch self {
        case .name:
            return "name"
        case .date:
            return "date"
        case .size:
            return "size"
        case .customValue(let value):
            return value
        }
    }

}
