import Foundation

public class SkillInvocationTokenWriteField: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case tokenType = "token_type"
        case restrictedTo = "restricted_to"
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// The requested access token.
    public let accessToken: String?

    /// The time in seconds by which this token will expire.
    public let expiresIn: Int64?

    /// The type of access token returned.
    public let tokenType: SkillInvocationTokenWriteTokenTypeField?

    /// The permissions that this access token permits,
    /// providing a list of resources (files, folders, etc)
    /// and the scopes permitted for each of those resources.
    public let restrictedTo: String?

    /// Initializer for a SkillInvocationTokenWriteField.
    ///
    /// - Parameters:
    ///   - accessToken: The requested access token.
    ///   - expiresIn: The time in seconds by which this token will expire.
    ///   - tokenType: The type of access token returned.
    ///   - restrictedTo: The permissions that this access token permits,
    ///     providing a list of resources (files, folders, etc)
    ///     and the scopes permitted for each of those resources.
    public init(accessToken: String? = nil, expiresIn: Int64? = nil, tokenType: SkillInvocationTokenWriteTokenTypeField? = nil, restrictedTo: String? = nil) {
        self.accessToken = accessToken
        self.expiresIn = expiresIn
        self.tokenType = tokenType
        self.restrictedTo = restrictedTo
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        accessToken = try container.decodeIfPresent(String.self, forKey: .accessToken)
        expiresIn = try container.decodeIfPresent(Int64.self, forKey: .expiresIn)
        tokenType = try container.decodeIfPresent(SkillInvocationTokenWriteTokenTypeField.self, forKey: .tokenType)
        restrictedTo = try container.decodeIfPresent(String.self, forKey: .restrictedTo)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(accessToken, forKey: .accessToken)
        try container.encodeIfPresent(expiresIn, forKey: .expiresIn)
        try container.encodeIfPresent(tokenType, forKey: .tokenType)
        try container.encodeIfPresent(restrictedTo, forKey: .restrictedTo)
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
