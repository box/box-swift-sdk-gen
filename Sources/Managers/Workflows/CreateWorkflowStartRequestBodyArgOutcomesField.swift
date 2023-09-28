import Foundation

public class CreateWorkflowStartRequestBodyArgOutcomesField: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case parameter
    }

    /// The id of the outcome,
    public let id: String?
    /// The type of the outcome object,
    public let type: CreateWorkflowStartRequestBodyArgOutcomesFieldTypeField?
    /// This is a placeholder example for various objects that
    /// can be passed in - refer to the guides section to find
    /// out more information.,
    public let parameter: String?

    /// Initializer for a CreateWorkflowStartRequestBodyArgOutcomesField.
    ///
    /// - Parameters:
    ///   - id: The id of the outcome
    ///   - type: The type of the outcome object
    ///   - parameter: This is a placeholder example for various objects that
    ///     can be passed in - refer to the guides section to find
    ///     out more information.
    public init(id: String? = nil, type: CreateWorkflowStartRequestBodyArgOutcomesFieldTypeField? = nil, parameter: String? = nil) {
        self.id = id
        self.type = type
        self.parameter = parameter
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        type = try container.decodeIfPresent(CreateWorkflowStartRequestBodyArgOutcomesFieldTypeField.self, forKey: .type)
        parameter = try container.decodeIfPresent(String.self, forKey: .parameter)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(parameter, forKey: .parameter)
    }
}
