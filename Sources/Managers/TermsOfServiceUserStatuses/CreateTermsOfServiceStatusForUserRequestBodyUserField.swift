import Foundation

public class CreateTermsOfServiceStatusForUserRequestBodyUserField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
    }

    /// The type of object.
    public let type: CreateTermsOfServiceStatusForUserRequestBodyUserTypeField

    /// The ID of user
    public let id: String

    /// Initializer for a CreateTermsOfServiceStatusForUserRequestBodyUserField.
    ///
    /// - Parameters:
    ///   - type: The type of object.
    ///   - id: The ID of user
    public init(type: CreateTermsOfServiceStatusForUserRequestBodyUserTypeField, id: String) {
        self.type = type
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(CreateTermsOfServiceStatusForUserRequestBodyUserTypeField.self, forKey: .type)
        id = try container.decode(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(id, forKey: .id)
    }

}
