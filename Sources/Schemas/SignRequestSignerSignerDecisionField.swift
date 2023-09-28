import Foundation

public class SignRequestSignerSignerDecisionField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case finalizedAt = "finalized_at"
    }

    /// Type of decision made by the signer,
    public let type: SignRequestSignerSignerDecisionFieldTypeField?
    /// Date and Time that the decision was made,
    public let finalizedAt: String?

    /// Initializer for a SignRequestSignerSignerDecisionField.
    ///
    /// - Parameters:
    ///   - type: Type of decision made by the signer
    ///   - finalizedAt: Date and Time that the decision was made
    public init(type: SignRequestSignerSignerDecisionFieldTypeField? = nil, finalizedAt: String? = nil) {
        self.type = type
        self.finalizedAt = finalizedAt
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(SignRequestSignerSignerDecisionFieldTypeField.self, forKey: .type)
        finalizedAt = try container.decodeIfPresent(String.self, forKey: .finalizedAt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(finalizedAt, forKey: .finalizedAt)
    }
}
