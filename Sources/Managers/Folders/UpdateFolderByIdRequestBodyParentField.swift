import Foundation

public class UpdateFolderByIdRequestBodyParentField: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
    }

    /// The ID of the new parent folder
    public let id: String?

    /// Initializer for a UpdateFolderByIdRequestBodyParentField.
    ///
    /// - Parameters:
    ///   - id: The ID of the new parent folder
    public init(id: String? = nil) {
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
    }

}
