import Foundation

public class CreateTermOfServiceRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case status
        case text
        case tosType = "tos_type"
    }

    /// Whether this terms of service is active.
    public let status: CreateTermOfServiceRequestBodyArgStatusField
    /// The terms of service text to display to users.
    /// 
    /// The text can be set to empty if the `status` is set to `disabled`.
    public let text: String
    /// The type of user to set the terms of
    /// service for.
    public let tosType: CreateTermOfServiceRequestBodyArgTosTypeField?

    /// Initializer for a CreateTermOfServiceRequestBodyArg.
    ///
    /// - Parameters:
    ///   - status: Whether this terms of service is active.
    ///   - text: The terms of service text to display to users.
    ///     
    ///     The text can be set to empty if the `status` is set to `disabled`.
    ///   - tosType: The type of user to set the terms of
    ///     service for.
    public init(status: CreateTermOfServiceRequestBodyArgStatusField, text: String, tosType: CreateTermOfServiceRequestBodyArgTosTypeField? = nil) {
        self.status = status
        self.text = text
        self.tosType = tosType
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(CreateTermOfServiceRequestBodyArgStatusField.self, forKey: .status)
        text = try container.decode(String.self, forKey: .text)
        tosType = try container.decodeIfPresent(CreateTermOfServiceRequestBodyArgTosTypeField.self, forKey: .tosType)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(status, forKey: .status)
        try container.encode(text, forKey: .text)
        try container.encodeIfPresent(tosType, forKey: .tosType)
    }
}
