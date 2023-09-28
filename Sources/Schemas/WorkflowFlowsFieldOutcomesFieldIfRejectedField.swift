import Foundation

public class WorkflowFlowsFieldOutcomesFieldIfRejectedField: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case name
        case actionType = "action_type"
    }

    /// The identifier of the outcome,
    public let id: String?
    /// The outcomes resource type,
    public let type: WorkflowFlowsFieldOutcomesFieldIfRejectedFieldTypeField?
    /// The name of the outcome,
    public let name: String?
    public let actionType: WorkflowFlowsFieldOutcomesFieldIfRejectedFieldActionTypeField?

    /// Initializer for a WorkflowFlowsFieldOutcomesFieldIfRejectedField.
    ///
    /// - Parameters:
    ///   - id: The identifier of the outcome
    ///   - type: The outcomes resource type
    ///   - name: The name of the outcome
    ///   - actionType: WorkflowFlowsFieldOutcomesFieldIfRejectedFieldActionTypeField?
    public init(id: String? = nil, type: WorkflowFlowsFieldOutcomesFieldIfRejectedFieldTypeField? = nil, name: String? = nil, actionType: WorkflowFlowsFieldOutcomesFieldIfRejectedFieldActionTypeField? = nil) {
        self.id = id
        self.type = type
        self.name = name
        self.actionType = actionType
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        type = try container.decodeIfPresent(WorkflowFlowsFieldOutcomesFieldIfRejectedFieldTypeField.self, forKey: .type)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        actionType = try container.decodeIfPresent(WorkflowFlowsFieldOutcomesFieldIfRejectedFieldActionTypeField.self, forKey: .actionType)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(actionType, forKey: .actionType)
    }
}
