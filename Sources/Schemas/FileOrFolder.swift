import Foundation

public enum FileOrFolder: Codable {
    case file(File)
    case folder(Folder)

    private enum DeterminerCodingKey: String, CodingKey {
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DeterminerCodingKey.self)
        if let type = try? container.decode(String.self, forKey: .type) {
            switch type {
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
            default:
                throw DecodingError.typeMismatch(FileOrFolder.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The Decoded object contains an unexpeted value for key type"))
            }
        }

        throw DecodingError.keyNotFound(DeterminerCodingKey.type, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The Decoded object doesn't contain entry with type key"))
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
        case .file(let file):
            try file.encode(to: encoder)
        case .folder(let folder):
            try folder.encode(to: encoder)
        }
    }
}
