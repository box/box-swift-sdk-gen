import Foundation

/// A completion
/// rule object. Determines
/// if an action should be completed
/// by all or any assignees.
public class CompletionRuleVariable: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case variableType = "variable_type"
        case variableValue = "variable_value"
    }

    /// Completion
    /// Rule object type.
    /// 
    public let type: CompletionRuleVariableTypeField

    /// Variable type
    /// for the Completion
    /// Rule object.
    /// 
    public let variableType: CompletionRuleVariableVariableTypeField

    /// Variable
    /// values for a completion
    /// rule.
    /// 
    public let variableValue: CompletionRuleVariableVariableValueField

    /// Initializer for a CompletionRuleVariable.
    ///
    /// - Parameters:
    ///   - type: Completion
    ///     Rule object type.
    ///     
    ///   - variableType: Variable type
    ///     for the Completion
    ///     Rule object.
    ///     
    ///   - variableValue: Variable
    ///     values for a completion
    ///     rule.
    ///     
    public init(type: CompletionRuleVariableTypeField, variableType: CompletionRuleVariableVariableTypeField, variableValue: CompletionRuleVariableVariableValueField) {
        self.type = type
        self.variableType = variableType
        self.variableValue = variableValue
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(CompletionRuleVariableTypeField.self, forKey: .type)
        variableType = try container.decode(CompletionRuleVariableVariableTypeField.self, forKey: .variableType)
        variableValue = try container.decode(CompletionRuleVariableVariableValueField.self, forKey: .variableValue)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(variableType, forKey: .variableType)
        try container.encode(variableValue, forKey: .variableValue)
    }

}
