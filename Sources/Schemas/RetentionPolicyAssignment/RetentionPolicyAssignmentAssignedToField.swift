import Foundation

public class RetentionPolicyAssignmentAssignedToField: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// The ID of the folder, enterprise, or metadata template
    /// the policy is assigned to.
    /// Set to null or omit when type is set to enterprise.
    @CodableTriState public private(set) var id: String?

    /// The type of resource the policy is assigned to.
    public let type: RetentionPolicyAssignmentAssignedToTypeField?

    /// Initializer for a RetentionPolicyAssignmentAssignedToField.
    ///
    /// - Parameters:
    ///   - id: The ID of the folder, enterprise, or metadata template
    ///     the policy is assigned to.
    ///     Set to null or omit when type is set to enterprise.
    ///   - type: The type of resource the policy is assigned to.
    public init(id: TriStateField<String> = nil, type: RetentionPolicyAssignmentAssignedToTypeField? = nil) {
        self._id = CodableTriState(state: id)
        self.type = type
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        type = try container.decodeIfPresent(RetentionPolicyAssignmentAssignedToTypeField.self, forKey: .type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(field: _id.state, forKey: .id)
        try container.encodeIfPresent(type, forKey: .type)
    }

    /// Sets the raw JSON data.
    ///
    /// - Parameters:
    ///   - rawData: A dictionary containing the raw JSON data
    func setRawData(rawData: [String: Any]?) {
        self._rawData = rawData
    }

    /// Gets the raw JSON data
    /// - Returns: The `[String: Any]?`.
    func getRawData() -> [String: Any]? {
        return self._rawData
    }

}
