import Foundation

public class UpdateLegalHoldPolicyByIdRequestBody: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case policyName = "policy_name"
        case description
        case releaseNotes = "release_notes"
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// The name of the policy.
    public let policyName: String?

    /// A description for the policy.
    public let description: String?

    /// Notes around why the policy was released.
    public let releaseNotes: String?

    /// Initializer for a UpdateLegalHoldPolicyByIdRequestBody.
    ///
    /// - Parameters:
    ///   - policyName: The name of the policy.
    ///   - description: A description for the policy.
    ///   - releaseNotes: Notes around why the policy was released.
    public init(policyName: String? = nil, description: String? = nil, releaseNotes: String? = nil) {
        self.policyName = policyName
        self.description = description
        self.releaseNotes = releaseNotes
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        policyName = try container.decodeIfPresent(String.self, forKey: .policyName)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        releaseNotes = try container.decodeIfPresent(String.self, forKey: .releaseNotes)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(policyName, forKey: .policyName)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(releaseNotes, forKey: .releaseNotes)
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
