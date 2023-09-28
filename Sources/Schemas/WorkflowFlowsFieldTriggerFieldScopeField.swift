import Foundation

public class WorkflowFlowsFieldTriggerFieldScopeField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case ref
        case object
    }

    /// The trigger scope's resource type,
    public let type: WorkflowFlowsFieldTriggerFieldScopeFieldTypeField?
    /// Indicates the path of the condition value to check,
    public let ref: String?
    /// The object the `ref` points to,
    public let object: WorkflowFlowsFieldTriggerFieldScopeFieldObjectField?

    /// Initializer for a WorkflowFlowsFieldTriggerFieldScopeField.
    ///
    /// - Parameters:
    ///   - type: The trigger scope's resource type
    ///   - ref: Indicates the path of the condition value to check
    ///   - object: The object the `ref` points to
    public init(type: WorkflowFlowsFieldTriggerFieldScopeFieldTypeField? = nil, ref: String? = nil, object: WorkflowFlowsFieldTriggerFieldScopeFieldObjectField? = nil) {
        self.type = type
        self.ref = ref
        self.object = object
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(WorkflowFlowsFieldTriggerFieldScopeFieldTypeField.self, forKey: .type)
        ref = try container.decodeIfPresent(String.self, forKey: .ref)
        object = try container.decodeIfPresent(WorkflowFlowsFieldTriggerFieldScopeFieldObjectField.self, forKey: .object)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(ref, forKey: .ref)
        try container.encodeIfPresent(object, forKey: .object)
    }
}
