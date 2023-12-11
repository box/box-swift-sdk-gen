import Foundation

public class CreateTermOfServiceUserStatusRequestBodyArgTosField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
    }

    /// The type of object.
    public let type: CreateTermOfServiceUserStatusRequestBodyArgTosFieldTypeField

    /// The ID of terms of service
    public let id: String

    /// Initializer for a CreateTermOfServiceUserStatusRequestBodyArgTosField.
    ///
    /// - Parameters:
    ///   - type: The type of object.
    ///   - id: The ID of terms of service
    public init(type: CreateTermOfServiceUserStatusRequestBodyArgTosFieldTypeField, id: String) {
        self.type = type
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(CreateTermOfServiceUserStatusRequestBodyArgTosFieldTypeField.self, forKey: .type)
        id = try container.decode(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(id, forKey: .id)
    }

}
