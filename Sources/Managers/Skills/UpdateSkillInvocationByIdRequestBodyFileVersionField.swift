import Foundation

public class UpdateSkillInvocationByIdRequestBodyFileVersionField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
    }

    /// `file_version`
    public let type: UpdateSkillInvocationByIdRequestBodyFileVersionTypeField?

    /// The ID of the file version
    public let id: String?

    /// Initializer for a UpdateSkillInvocationByIdRequestBodyFileVersionField.
    ///
    /// - Parameters:
    ///   - type: `file_version`
    ///   - id: The ID of the file version
    public init(type: UpdateSkillInvocationByIdRequestBodyFileVersionTypeField? = nil, id: String? = nil) {
        self.type = type
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(UpdateSkillInvocationByIdRequestBodyFileVersionTypeField.self, forKey: .type)
        id = try container.decodeIfPresent(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(id, forKey: .id)
    }

}
