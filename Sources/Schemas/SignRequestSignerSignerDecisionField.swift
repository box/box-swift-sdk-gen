import Foundation

public class SignRequestSignerSignerDecisionField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case finalizedAt = "finalized_at"
        case additionalInfo = "additional_info"
    }

    /// Type of decision made by the signer
    public let type: SignRequestSignerSignerDecisionFieldTypeField?
    /// Date and Time that the decision was made
    public let finalizedAt: String?
    /// Additional info about the decision, such as the decline reason from the signer
    public let additionalInfo: String?

    /// Initializer for a SignRequestSignerSignerDecisionField.
    ///
    /// - Parameters:
    ///   - type: Type of decision made by the signer
    ///   - finalizedAt: Date and Time that the decision was made
    ///   - additionalInfo: Additional info about the decision, such as the decline reason from the signer
    public init(type: SignRequestSignerSignerDecisionFieldTypeField? = nil, finalizedAt: String? = nil, additionalInfo: String? = nil) {
        self.type = type
        self.finalizedAt = finalizedAt
        self.additionalInfo = additionalInfo
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(SignRequestSignerSignerDecisionFieldTypeField.self, forKey: .type)
        finalizedAt = try container.decodeIfPresent(String.self, forKey: .finalizedAt)
        additionalInfo = try container.decodeIfPresent(String.self, forKey: .additionalInfo)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(finalizedAt, forKey: .finalizedAt)
        try container.encodeIfPresent(additionalInfo, forKey: .additionalInfo)
    }
}
