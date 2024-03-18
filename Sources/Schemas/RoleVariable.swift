import Foundation

/// Determines if the
/// workflow outcome
/// affects a specific
/// collaborator role.
public class RoleVariable: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case variableType = "variable_type"
        case variableValue = "variable_value"
    }

    /// Role object type.
    /// 
    public let type: RoleVariableTypeField

    /// The variable type used
    /// by the object.
    /// 
    public let variableType: RoleVariableVariableTypeField

    public let variableValue: RoleVariableVariableValueField

    /// Initializer for a RoleVariable.
    ///
    /// - Parameters:
    ///   - type: Role object type.
    ///     
    ///   - variableType: The variable type used
    ///     by the object.
    ///     
    ///   - variableValue: 
    public init(type: RoleVariableTypeField, variableType: RoleVariableVariableTypeField, variableValue: RoleVariableVariableValueField) {
        self.type = type
        self.variableType = variableType
        self.variableValue = variableValue
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(RoleVariableTypeField.self, forKey: .type)
        variableType = try container.decode(RoleVariableVariableTypeField.self, forKey: .variableType)
        variableValue = try container.decode(RoleVariableVariableValueField.self, forKey: .variableValue)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(variableType, forKey: .variableType)
        try container.encode(variableValue, forKey: .variableValue)
    }

}
