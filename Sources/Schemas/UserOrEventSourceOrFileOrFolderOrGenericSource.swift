import Foundation

public enum UserOrEventSourceOrFileOrFolderOrGenericSource: Codable {
    case eventSource(EventSource)
    case file(File)
    case folder(Folder)
    case user(User)
    case genericSource(GenericSource)

    private enum DiscriminatorCodingKey: String, CodingKey {
        case itemType = "item_type"
        case type
    }

    public init(from decoder: Decoder) throws {
        if let container = try? decoder.container(keyedBy: DiscriminatorCodingKey.self) {
            if let discriminator_0 = try? container.decode(String.self, forKey: .itemType) {
                switch discriminator_0 {
                case "file":
                    if let content = try? EventSource(from: decoder) {
                        self = .eventSource(content)
                        return
                    }

                case "folder":
                    if let content = try? EventSource(from: decoder) {
                        self = .eventSource(content)
                        return
                    }

                default:
                    throw DecodingError.typeMismatch(UserOrEventSourceOrFileOrFolderOrGenericSource.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The Decoded object contains an unexpected value for key itemType"))

                }
            }

            if let discriminator_1 = try? container.decode(String.self, forKey: .type) {
                switch discriminator_1 {
                case "file":
                    if let content = try? File(from: decoder) {
                        self = .file(content)
                        return
                    }

                case "folder":
                    if let content = try? Folder(from: decoder) {
                        self = .folder(content)
                        return
                    }

                case "user":
                    if let content = try? User(from: decoder) {
                        self = .user(content)
                        return
                    }

                default:
                    throw DecodingError.typeMismatch(UserOrEventSourceOrFileOrFolderOrGenericSource.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The Decoded object contains an unexpected value for key type"))

                }
            }

        }

        if let content = try? GenericSource(from: decoder) {
            self = .genericSource(content)
            return
        }

        throw DecodingError.typeMismatch(UserOrEventSourceOrFileOrFolderOrGenericSource.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The type of the decoded object cannot be determined."))

    }

    public func encode(to encoder: Encoder) throws {
        switch self {
        case .eventSource(let eventSource):
            try eventSource.encode(to: encoder)
        case .file(let file):
            try file.encode(to: encoder)
        case .folder(let folder):
            try folder.encode(to: encoder)
        case .user(let user):
            try user.encode(to: encoder)
        case .genericSource(let genericSource):
            try genericSource.encode(to: encoder)
        }
    }

}
