import Foundation

public enum FileFullOrFolderFullOrWebLink: Codable {
    case fileFull(FileFull)
    case folderFull(FolderFull)
    case webLink(WebLink)

    private enum DeterminerCodingKey: String, CodingKey {
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DeterminerCodingKey.self)
        if let type = try? container.decode(String.self, forKey: .type) {
            switch type {
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
                throw DecodingError.typeMismatch(FileFullOrFolderFullOrWebLink.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The Decoded object contains an unexpeted value for key type"))

            }
        }

        throw DecodingError.keyNotFound(DeterminerCodingKey.type, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The Decoded object doesn't contain entry with type key"))
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
