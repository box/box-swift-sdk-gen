import Foundation

public enum FileFullOrFolderFullOrWebLink: Codable {
    case fileFull(FileFull)
    case folderFull(FolderFull)
    case webLink(WebLink)

    private enum DiscriminatorCodingKey: String, CodingKey {
        case type
    }

    public init(from decoder: Decoder) throws {
        if let container = try? decoder.container(keyedBy: DiscriminatorCodingKey.self) {
            if let discriminator_0 = try? container.decode(String.self, forKey: .type) {
                switch discriminator_0 {
                case "file":
                    if let content = try? FileFull(from: decoder) {
                        self = .fileFull(content)
                        return
                    }

                case "folder":
                    if let content = try? FolderFull(from: decoder) {
                        self = .folderFull(content)
                        return
                    }

                case "web_link":
                    if let content = try? WebLink(from: decoder) {
                        self = .webLink(content)
                        return
                    }

                default:
                    break
                }
            }

        }

        throw DecodingError.typeMismatch(FileFullOrFolderFullOrWebLink.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The type of the decoded object cannot be determined."))

    }

    public func encode(to encoder: Encoder) throws {
        switch self {
        case .fileFull(let fileFull):
            try fileFull.encode(to: encoder)
        case .folderFull(let folderFull):
            try folderFull.encode(to: encoder)
        case .webLink(let webLink):
            try webLink.encode(to: encoder)
        }
    }

}
