import Foundation

public class WorkflowFlowsFieldTriggerFieldScopeFieldObjectField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
    }

    /// The type of the object
    public let type: WorkflowFlowsFieldTriggerFieldScopeFieldObjectFieldTypeField?
    /// The id of the object
    public let id: String?

    /// Initializer for a WorkflowFlowsFieldTriggerFieldScopeFieldObjectField.
    ///
    /// - Parameters:
    ///   - type: The type of the object
    ///   - id: The id of the object
    public init(type: WorkflowFlowsFieldTriggerFieldScopeFieldObjectFieldTypeField? = nil, id: String? = nil) {
        self.type = type
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(WorkflowFlowsFieldTriggerFieldScopeFieldObjectFieldTypeField.self, forKey: .type)
        id = try container.decodeIfPresent(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(id, forKey: .id)
    }
}
