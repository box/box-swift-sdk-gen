import Foundation

public enum GroupMiniOrUserCollaborations: Codable {
    case groupMini(GroupMini)
    case userCollaborations(UserCollaborations)

    private enum DeterminerCodingKey: String, CodingKey {
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DeterminerCodingKey.self)
        if let type = try? container.decode(String.self, forKey: .type) {
            switch type {
            case "group":
                if let content = try? GroupMini(from: decoder) {
                    self = .groupMini(content)
                    return
                }
            case "user":
                if let content = try? UserCollaborations(from: decoder) {
                    self = .userCollaborations(content)
                    return
                }
            default:
                throw DecodingError.typeMismatch(GroupMiniOrUserCollaborations.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The Decoded object contains an unexpeted value for key type"))
            }
        }

        throw DecodingError.keyNotFound(DeterminerCodingKey.type, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The Decoded object doesn't contain entry with type key"))
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
        case .groupMini(let groupMini):
            try groupMini.encode(to: encoder)
        case .userCollaborations(let userCollaborations):
            try userCollaborations.encode(to: encoder)
        }
    }
}
