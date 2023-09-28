import Foundation

public class CreateTermOfServiceRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case status
        case tosType = "tos_type"
        case text
    }

    /// Whether this terms of service is active.,
    public let status: CreateTermOfServiceRequestBodyArgStatusField
    /// The type of user to set the terms of
    /// service for.,
    public let tosType: CreateTermOfServiceRequestBodyArgTosTypeField?
    /// The terms of service text to display to users.
    /// 
    /// The text can be set to empty if the `status` is set to `disabled`.,
    public let text: String

    /// Initializer for a CreateTermOfServiceRequestBodyArg.
    ///
    /// - Parameters:
    ///   - status: Whether this terms of service is active.
    ///   - tosType: The type of user to set the terms of
    ///     service for.
    ///   - text: The terms of service text to display to users.
    ///     
    ///     The text can be set to empty if the `status` is set to `disabled`.
    public init(status: CreateTermOfServiceRequestBodyArgStatusField, tosType: CreateTermOfServiceRequestBodyArgTosTypeField? = nil, text: String) {
        self.status = status
        self.tosType = tosType
        self.text = text
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(CreateTermOfServiceRequestBodyArgStatusField.self, forKey: .status)
        tosType = try container.decodeIfPresent(CreateTermOfServiceRequestBodyArgTosTypeField.self, forKey: .tosType)
        text = try container.decode(String.self, forKey: .text)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(status, forKey: .status)
        try container.encodeIfPresent(tosType, forKey: .tosType)
        try container.encode(text, forKey: .text)
    }
}
