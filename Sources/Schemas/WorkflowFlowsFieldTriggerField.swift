import Foundation

public class WorkflowFlowsFieldTriggerField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case triggerType = "trigger_type"
        case scope
    }

    /// The trigger's resource type
    public let type: WorkflowFlowsFieldTriggerFieldTypeField?

    /// The type of trigger selected for this flow
    public let triggerType: WorkflowFlowsFieldTriggerFieldTriggerTypeField?

    /// List of trigger scopes
    public let scope: [WorkflowFlowsFieldTriggerFieldScopeField]?

    /// Initializer for a WorkflowFlowsFieldTriggerField.
    ///
    /// - Parameters:
    ///   - type: The trigger's resource type
    ///   - triggerType: The type of trigger selected for this flow
    ///   - scope: List of trigger scopes
    public init(type: WorkflowFlowsFieldTriggerFieldTypeField? = nil, triggerType: WorkflowFlowsFieldTriggerFieldTriggerTypeField? = nil, scope: [WorkflowFlowsFieldTriggerFieldScopeField]? = nil) {
        self.type = type
        self.triggerType = triggerType
        self.scope = scope
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(WorkflowFlowsFieldTriggerFieldTypeField.self, forKey: .type)
        triggerType = try container.decodeIfPresent(WorkflowFlowsFieldTriggerFieldTriggerTypeField.self, forKey: .triggerType)
        scope = try container.decodeIfPresent([WorkflowFlowsFieldTriggerFieldScopeField].self, forKey: .scope)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(triggerType, forKey: .triggerType)
        try container.encodeIfPresent(scope, forKey: .scope)
    }

}
