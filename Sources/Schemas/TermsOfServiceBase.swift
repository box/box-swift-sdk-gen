import Foundation

/// The root-level record that is supposed to represent a
/// single Terms of Service.
public class TermsOfServiceBase: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
    }

    /// The unique identifier for this terms of service.
    public let id: String?
    /// `terms_of_service`
    public let type: TermsOfServiceBaseTypeField?

    /// Initializer for a TermsOfServiceBase.
    ///
    /// - Parameters:
    ///   - id: The unique identifier for this terms of service.
    ///   - type: `terms_of_service`
    public init(id: String? = nil, type: TermsOfServiceBaseTypeField? = nil) {
        self.id = id
        self.type = type
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        type = try container.decodeIfPresent(TermsOfServiceBaseTypeField.self, forKey: .type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(type, forKey: .type)
    }
}
