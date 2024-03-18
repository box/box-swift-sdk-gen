import Foundation

/// A collaborator
/// object. Allows to
/// specify a list of user
/// ID's that are affected
/// by the workflow result.
public class CollaboratorVariable: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case variableType = "variable_type"
        case variableValue = "variable_value"
    }

    /// Collaborator
    /// object type.
    /// 
    public let type: CollaboratorVariableTypeField

    /// Variable type 
    /// for the Collaborator
    /// object.
    /// 
    public let variableType: CollaboratorVariableVariableTypeField

    /// A list of user IDs.
    public let variableValue: [CollaboratorVariableVariableValueField]

    /// Initializer for a CollaboratorVariable.
    ///
    /// - Parameters:
    ///   - type: Collaborator
    ///     object type.
    ///     
    ///   - variableType: Variable type 
    ///     for the Collaborator
    ///     object.
    ///     
    ///   - variableValue: A list of user IDs.
    public init(type: CollaboratorVariableTypeField, variableType: CollaboratorVariableVariableTypeField, variableValue: [CollaboratorVariableVariableValueField]) {
        self.type = type
        self.variableType = variableType
        self.variableValue = variableValue
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(CollaboratorVariableTypeField.self, forKey: .type)
        variableType = try container.decode(CollaboratorVariableVariableTypeField.self, forKey: .variableType)
        variableValue = try container.decode([CollaboratorVariableVariableValueField].self, forKey: .variableValue)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(variableType, forKey: .variableType)
        try container.encode(variableValue, forKey: .variableValue)
    }

}
