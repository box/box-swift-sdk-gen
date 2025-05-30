import Foundation

public enum CreateLegalHoldPolicyAssignmentRequestBodyAssignToTypeField: CodableStringEnum {
    case file
    case fileVersion
    case folder
    case user
    case ownership
    case interaction
    case customValue(String)

    public init(rawValue value: String) {
        switch value.lowercased() {
        case "file".lowercased():
            self = .file
        case "file_version".lowercased():
            self = .fileVersion
        case "folder".lowercased():
            self = .folder
        case "user".lowercased():
            self = .user
        case "ownership".lowercased():
            self = .ownership
        case "interaction".lowercased():
            self = .interaction
        default:
            self = .customValue(value)
        }
    }

    public var rawValue: String {
        switch self {
        case .file:
            return "file"
        case .fileVersion:
            return "file_version"
        case .folder:
            return "folder"
        case .user:
            return "user"
        case .ownership:
            return "ownership"
        case .interaction:
            return "interaction"
        case .customValue(let value):
            return value
        }
    }

}
