import Foundation

public class SignTemplateCustomBrandingField: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case companyName = "company_name"
        case logoUri = "logo_uri"
        case brandingColor = "branding_color"
        case emailFooterText = "email_footer_text"
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// Name of the company.
    @CodableTriState public private(set) var companyName: String?

    /// Custom branding logo URI in the form of a base64 image.
    @CodableTriState public private(set) var logoUri: String?

    /// Custom branding color in hex.
    @CodableTriState public private(set) var brandingColor: String?

    /// Content of the email footer.
    @CodableTriState public private(set) var emailFooterText: String?

    /// Initializer for a SignTemplateCustomBrandingField.
    ///
    /// - Parameters:
    ///   - companyName: Name of the company.
    ///   - logoUri: Custom branding logo URI in the form of a base64 image.
    ///   - brandingColor: Custom branding color in hex.
    ///   - emailFooterText: Content of the email footer.
    public init(companyName: TriStateField<String> = nil, logoUri: TriStateField<String> = nil, brandingColor: TriStateField<String> = nil, emailFooterText: TriStateField<String> = nil) {
        self._companyName = CodableTriState(state: companyName)
        self._logoUri = CodableTriState(state: logoUri)
        self._brandingColor = CodableTriState(state: brandingColor)
        self._emailFooterText = CodableTriState(state: emailFooterText)
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
        try container.encode(field: _companyName.state, forKey: .companyName)
        try container.encode(field: _logoUri.state, forKey: .logoUri)
        try container.encode(field: _brandingColor.state, forKey: .brandingColor)
        try container.encode(field: _emailFooterText.state, forKey: .emailFooterText)
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
