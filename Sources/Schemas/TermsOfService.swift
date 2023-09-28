import Foundation

public class TermsOfService: TermsOfServiceBase {
    private enum CodingKeys: String, CodingKey {
        case status
        case enterprise
        case tosType = "tos_type"
        case text
        case createdAt = "created_at"
        case modifiedAt = "modified_at"
    }

    /// Whether these terms are enabled or not,
    public let status: TermsOfServiceStatusField?
    public let enterprise: TermsOfServiceEnterpriseField?
    /// Whether to apply these terms to managed users or external users,
    public let tosType: TermsOfServiceTosTypeField?
    /// The text for your terms and conditions. This text could be
    /// empty if the `status` is set to `disabled`.,
    public let text: String?
    /// When the legal item was created,
    public let createdAt: String?
    /// When the legal item was modified.,
    public let modifiedAt: String?

    /// Initializer for a TermsOfService.
    ///
    /// - Parameters:
    ///   - id: The unique identifier for this terms of service.
    ///   - type: `terms_of_service`
    ///   - status: Whether these terms are enabled or not
    ///   - enterprise: TermsOfServiceEnterpriseField?
    ///   - tosType: Whether to apply these terms to managed users or external users
    ///   - text: The text for your terms and conditions. This text could be
    ///     empty if the `status` is set to `disabled`.
    ///   - createdAt: When the legal item was created
    ///   - modifiedAt: When the legal item was modified.
    public init(id: String? = nil, type: TermsOfServiceBaseTypeField? = nil, status: TermsOfServiceStatusField? = nil, enterprise: TermsOfServiceEnterpriseField? = nil, tosType: TermsOfServiceTosTypeField? = nil, text: String? = nil, createdAt: String? = nil, modifiedAt: String? = nil) {
        self.status = status
        self.enterprise = enterprise
        self.tosType = tosType
        self.text = text
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        super.init(id: id, type: type)
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decodeIfPresent(TermsOfServiceStatusField.self, forKey: .status)
        enterprise = try container.decodeIfPresent(TermsOfServiceEnterpriseField.self, forKey: .enterprise)
        tosType = try container.decodeIfPresent(TermsOfServiceTosTypeField.self, forKey: .tosType)
        text = try container.decodeIfPresent(String.self, forKey: .text)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        modifiedAt = try container.decodeIfPresent(String.self, forKey: .modifiedAt)
        try super.init(from:decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(enterprise, forKey: .enterprise)
        try container.encodeIfPresent(tosType, forKey: .tosType)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(modifiedAt, forKey: .modifiedAt)
        try super.encode(to: encoder)
    }
}
