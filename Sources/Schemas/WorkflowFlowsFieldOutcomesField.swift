import Foundation

public class WorkflowFlowsFieldOutcomesField: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case name
        case actionType = "action_type"
        case ifRejected = "if_rejected"
    }

    /// The identifier of the outcome,
    public let id: String?
    /// The outcomes resource type,
    public let type: WorkflowFlowsFieldOutcomesFieldTypeField?
    /// The name of the outcome,
    public let name: String?
    public let actionType: WorkflowFlowsFieldOutcomesFieldActionTypeField?
    /// If `action_type` is `assign_task` and the task is rejected, returns a
    /// list of outcomes to complete,
    public let ifRejected: [WorkflowFlowsFieldOutcomesFieldIfRejectedField]?

    /// Initializer for a WorkflowFlowsFieldOutcomesField.
    ///
    /// - Parameters:
    ///   - id: The identifier of the outcome
    ///   - type: The outcomes resource type
    ///   - name: The name of the outcome
    ///   - actionType: WorkflowFlowsFieldOutcomesFieldActionTypeField?
    ///   - ifRejected: If `action_type` is `assign_task` and the task is rejected, returns a
    ///     list of outcomes to complete
    public init(id: String? = nil, type: WorkflowFlowsFieldOutcomesFieldTypeField? = nil, name: String? = nil, actionType: WorkflowFlowsFieldOutcomesFieldActionTypeField? = nil, ifRejected: [WorkflowFlowsFieldOutcomesFieldIfRejectedField]? = nil) {
        self.id = id
        self.type = type
        self.name = name
        self.actionType = actionType
        self.ifRejected = ifRejected
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        type = try container.decodeIfPresent(WorkflowFlowsFieldOutcomesFieldTypeField.self, forKey: .type)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        actionType = try container.decodeIfPresent(WorkflowFlowsFieldOutcomesFieldActionTypeField.self, forKey: .actionType)
        ifRejected = try container.decodeIfPresent([WorkflowFlowsFieldOutcomesFieldIfRejectedField].self, forKey: .ifRejected)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(actionType, forKey: .actionType)
        try container.encodeIfPresent(ifRejected, forKey: .ifRejected)
    }
}
