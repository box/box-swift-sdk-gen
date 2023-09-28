import Foundation

public class UpdateSkillInvocationByIdRequestBodyArgFileField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
    }

    /// `file`,
    public let type: UpdateSkillInvocationByIdRequestBodyArgFileFieldTypeField?
    /// The ID of the file,
    public let id: String?

    /// Initializer for a UpdateSkillInvocationByIdRequestBodyArgFileField.
    ///
    /// - Parameters:
    ///   - type: `file`
    ///   - id: The ID of the file
    public init(type: UpdateSkillInvocationByIdRequestBodyArgFileFieldTypeField? = nil, id: String? = nil) {
        self.type = type
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(UpdateSkillInvocationByIdRequestBodyArgFileFieldTypeField.self, forKey: .type)
        id = try container.decodeIfPresent(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(id, forKey: .id)
    }
}
