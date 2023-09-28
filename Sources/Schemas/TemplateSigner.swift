import Foundation

public class TemplateSigner: Codable {
    private enum CodingKeys: String, CodingKey {
        case inputs
        case email
        case role
        case isInPerson = "is_in_person"
        case order
    }

    public let inputs: [TemplateSignerInput]?
    /// Email address of the signer,
    public let email: String?
    /// Defines the role of the signer in the signature request. A role of
    /// `signer` needs to sign the document, a role `approver`
    /// approves the document and
    /// a `final_copy_reader` role only
    /// receives the final signed document and signing log.,
    public let role: TemplateSignerRoleField?
    /// Used in combination with an embed URL for a sender.
    /// After the sender signs, they will be
    /// redirected to the next `in_person` signer.,
    public let isInPerson: Bool?
    /// Order of the signer,
    public let order: Int?

    /// Initializer for a TemplateSigner.
    ///
    /// - Parameters:
    ///   - inputs: [TemplateSignerInput]?
    ///   - email: Email address of the signer
    ///   - role: Defines the role of the signer in the signature request. A role of
    ///     `signer` needs to sign the document, a role `approver`
    ///     approves the document and
    ///     a `final_copy_reader` role only
    ///     receives the final signed document and signing log.
    ///   - isInPerson: Used in combination with an embed URL for a sender.
    ///     After the sender signs, they will be
    ///     redirected to the next `in_person` signer.
    ///   - order: Order of the signer
    public init(inputs: [TemplateSignerInput]? = nil, email: String? = nil, role: TemplateSignerRoleField? = nil, isInPerson: Bool? = nil, order: Int? = nil) {
        self.inputs = inputs
        self.email = email
        self.role = role
        self.isInPerson = isInPerson
        self.order = order
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        inputs = try container.decodeIfPresent([TemplateSignerInput].self, forKey: .inputs)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        role = try container.decodeIfPresent(TemplateSignerRoleField.self, forKey: .role)
        isInPerson = try container.decodeIfPresent(Bool.self, forKey: .isInPerson)
        order = try container.decodeIfPresent(Int.self, forKey: .order)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(inputs, forKey: .inputs)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(role, forKey: .role)
        try container.encodeIfPresent(isInPerson, forKey: .isInPerson)
        try container.encodeIfPresent(order, forKey: .order)
    }
}
