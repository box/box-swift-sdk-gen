import Foundation

public class UpdateTermOfServiceByIdRequestBody: Codable {
    private enum CodingKeys: String, CodingKey {
        case status
        case text
    }

    /// Whether this terms of service is active.
    public let status: UpdateTermOfServiceByIdRequestBodyStatusField

    /// The terms of service text to display to users.
    /// 
    /// The text can be set to empty if the `status` is set to `disabled`.
    public let text: String

    /// Initializer for a UpdateTermOfServiceByIdRequestBody.
    ///
    /// - Parameters:
    ///   - status: Whether this terms of service is active.
    ///   - text: The terms of service text to display to users.
    ///     
    ///     The text can be set to empty if the `status` is set to `disabled`.
    public init(status: UpdateTermOfServiceByIdRequestBodyStatusField, text: String) {
        self.status = status
        self.text = text
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(UpdateTermOfServiceByIdRequestBodyStatusField.self, forKey: .status)
        text = try container.decode(String.self, forKey: .text)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(status, forKey: .status)
        try container.encode(text, forKey: .text)
    }

}
