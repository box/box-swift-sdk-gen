import Foundation

public class SignTemplateCustomBrandingField: Codable {
    private enum CodingKeys: String, CodingKey {
        case companyName = "company_name"
        case logoUri = "logo_uri"
        case brandingColor = "branding_color"
        case emailFooterText = "email_footer_text"
    }

    /// Name of the company
    public let companyName: String?
    /// Custom branding logo URI in the form of a base64 image.
    public let logoUri: String?
    /// Custom branding color in hex.
    public let brandingColor: String?
    /// Content of the email footer.
    public let emailFooterText: String?

    /// Initializer for a SignTemplateCustomBrandingField.
    ///
    /// - Parameters:
    ///   - companyName: Name of the company
    ///   - logoUri: Custom branding logo URI in the form of a base64 image.
    ///   - brandingColor: Custom branding color in hex.
    ///   - emailFooterText: Content of the email footer.
    public init(companyName: String? = nil, logoUri: String? = nil, brandingColor: String? = nil, emailFooterText: String? = nil) {
        self.companyName = companyName
        self.logoUri = logoUri
        self.brandingColor = brandingColor
        self.emailFooterText = emailFooterText
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        companyName = try container.decodeIfPresent(String.self, forKey: .companyName)
        logoUri = try container.decodeIfPresent(String.self, forKey: .logoUri)
        brandingColor = try container.decodeIfPresent(String.self, forKey: .brandingColor)
        emailFooterText = try container.decodeIfPresent(String.self, forKey: .emailFooterText)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(companyName, forKey: .companyName)
        try container.encodeIfPresent(logoUri, forKey: .logoUri)
        try container.encodeIfPresent(brandingColor, forKey: .brandingColor)
        try container.encodeIfPresent(emailFooterText, forKey: .emailFooterText)
    }
}
