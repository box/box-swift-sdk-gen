import Foundation

public class UpdateFileVersionByIdRequestBody: Codable {
    private enum CodingKeys: String, CodingKey {
        case trashedAt = "trashed_at"
    }

    /// Set this to `null` to clear
    /// the date and restore the file.
    public let trashedAt: String?

    /// Initializer for a UpdateFileVersionByIdRequestBody.
    ///
    /// - Parameters:
    ///   - trashedAt: Set this to `null` to clear
    ///     the date and restore the file.
    public init(trashedAt: String? = nil) {
        self.trashedAt = trashedAt
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        trashedAt = try container.decodeIfPresent(String.self, forKey: .trashedAt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(trashedAt, forKey: .trashedAt)
    }

}
