import Foundation

public enum FileMiniOrFolderMiniOrWebLink: Codable {
    case fileMini(FileMini)
    case folderMini(FolderMini)
    case webLink(WebLink)

    private enum DeterminerCodingKey: String, CodingKey {
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DeterminerCodingKey.self)
        if let type = try? container.decode(String.self, forKey: .type) {
            switch type {
            case "file":
                if let content = try? FileMini(from: decoder) {
                    self = .fileMini(content)
                    return
                }
            case "folder":
                if let content = try? FolderMini(from: decoder) {
                    self = .folderMini(content)
                    return
                }
            case "web_link":
                if let content = try? WebLink(from: decoder) {
                    self = .webLink(content)
                    return
                }
            default:
                throw DecodingError.typeMismatch(FileMiniOrFolderMiniOrWebLink.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The Decoded object contains an unexpeted value for key type"))
            }
        }

        throw DecodingError.keyNotFound(DeterminerCodingKey.type, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The Decoded object doesn't contain entry with type key"))
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
        case .fileMini(let fileMini):
            try fileMini.encode(to: encoder)
        case .folderMini(let folderMini):
            try folderMini.encode(to: encoder)
        case .webLink(let webLink):
            try webLink.encode(to: encoder)
        }
    }
}
