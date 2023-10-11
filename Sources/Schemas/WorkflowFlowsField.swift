import Foundation

public class WorkflowFlowsField: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case trigger
        case outcomes
        case createdAt = "created_at"
        case createdBy = "created_by"
    }

    /// The identifier of the flow
    public let id: String?
    /// The flow's resource type
    public let type: WorkflowFlowsFieldTypeField?
    public let trigger: WorkflowFlowsFieldTriggerField?
    public let outcomes: [WorkflowFlowsFieldOutcomesField]?
    /// When this flow was created
    public let createdAt: String?
    public let createdBy: UserBase?

    /// Initializer for a WorkflowFlowsField.
    ///
    /// - Parameters:
    ///   - id: The identifier of the flow
    ///   - type: The flow's resource type
    ///   - trigger: WorkflowFlowsFieldTriggerField?
    ///   - outcomes: [WorkflowFlowsFieldOutcomesField]?
    ///   - createdAt: When this flow was created
    ///   - createdBy: UserBase?
    public init(id: String? = nil, type: WorkflowFlowsFieldTypeField? = nil, trigger: WorkflowFlowsFieldTriggerField? = nil, outcomes: [WorkflowFlowsFieldOutcomesField]? = nil, createdAt: String? = nil, createdBy: UserBase? = nil) {
        self.id = id
        self.type = type
        self.trigger = trigger
        self.outcomes = outcomes
        self.createdAt = createdAt
        self.createdBy = createdBy
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        type = try container.decodeIfPresent(WorkflowFlowsFieldTypeField.self, forKey: .type)
        trigger = try container.decodeIfPresent(WorkflowFlowsFieldTriggerField.self, forKey: .trigger)
        outcomes = try container.decodeIfPresent([WorkflowFlowsFieldOutcomesField].self, forKey: .outcomes)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        createdBy = try container.decodeIfPresent(UserBase.self, forKey: .createdBy)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(trigger, forKey: .trigger)
        try container.encodeIfPresent(outcomes, forKey: .outcomes)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(createdBy, forKey: .createdBy)
    }
}
