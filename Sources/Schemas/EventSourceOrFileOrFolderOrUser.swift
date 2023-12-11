import Foundation

public enum EventSourceOrFileOrFolderOrUser: Codable {
    case eventSource(EventSource)
    case file(File)
    case folder(Folder)
    case user(User)

    public init(from decoder: Decoder) throws {
        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "The rules determining the decoding cannot be established."))
    }

    public func encode(to encoder: Encoder) throws {
        throw EncodingError.invalidValue(EventSourceOrFileOrFolderOrUser.self, EncodingError.Context(codingPath: [], debugDescription: "The rules determining the encoding cannot be established."))
    }

}
