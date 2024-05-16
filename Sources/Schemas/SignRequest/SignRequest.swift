import Foundation

/// A Box Sign request object.
public class SignRequest: SignRequestBase {
    private enum CodingKeys: String, CodingKey {
        case type
        case sourceFiles = "source_files"
        case signers
        case signatureColor = "signature_color"
        case id
        case prepareUrl = "prepare_url"
        case signingLog = "signing_log"
        case status
        case signFiles = "sign_files"
        case autoExpireAt = "auto_expire_at"
        case parentFolder = "parent_folder"
    }

    /// object type
    public let type: SignRequestTypeField?

    /// List of files to create a signing document from. This is currently limited to ten files. Only the ID and type fields are required for each file.
    public let sourceFiles: [FileBase]?

    /// Array of signers for the signature request.
    public let signers: [SignRequestSigner]?

    /// Force a specific color for the signature (blue, black, or red).
    public let signatureColor: String?

    /// Box Sign request ID.
    public let id: String?

    /// This URL is returned if `is_document_preparation_needed` is
    /// set to `true` for Box Sign request. It is used to prepare a signature request
    /// using the UI. The signature request is not sent until the preparation
    /// phase is complete.
    public let prepareUrl: String?

    public let signingLog: FileMini?

    /// Describes the status of the signature request.
    public let status: SignRequestStatusField?

    /// List of files that will be signed, which are copies of the original
    /// source files. A new version of these files are created as signers sign
    /// and can be downloaded at any point in the signing process.
    public let signFiles: SignRequestSignFilesField?

    /// Uses `days_valid` to calculate the date and time, in GMT, the sign request will expire if unsigned.
    public let autoExpireAt: Date?

    public let parentFolder: FolderMini?

    /// Initializer for a SignRequest.
    ///
    /// - Parameters:
    ///   - isDocumentPreparationNeeded: Indicates if the sender should receive a `prepare_url` in the response to complete document preparation using the UI.
    ///   - redirectUrl: When specified, the signature request will be redirected to this url when a document is signed.
    ///   - declinedRedirectUrl: The uri that a signer will be redirected to after declining to sign a document.
    ///   - areTextSignaturesEnabled: Disables the usage of signatures generated by typing (text).
    ///   - emailSubject: Subject of sign request email. This is cleaned by sign request. If this field is not passed, a default subject will be used.
    ///   - emailMessage: Message to include in sign request email. The field is cleaned through sanitization of specific characters. However, some html tags are allowed. Links included in the message are also converted to hyperlinks in the email. The message may contain the following html tags including `a`, `abbr`, `acronym`, `b`, `blockquote`, `code`, `em`, `i`, `ul`, `li`, `ol`, and `strong`. Be aware that when the text to html ratio is too high, the email may end up in spam filters. Custom styles on these tags are not allowed. If this field is not passed, a default message will be used.
    ///   - areRemindersEnabled: Reminds signers to sign a document on day 3, 8, 13 and 18. Reminders are only sent to outstanding signers.
    ///   - name: Name of the signature request.
    ///   - prefillTags: When a document contains sign-related tags in the content, you can prefill them using this `prefill_tags` by referencing the 'id' of the tag as the `external_id` field of the prefill tag.
    ///   - daysValid: Set the number of days after which the created signature request will automatically expire if not completed. By default, we do not apply any expiration date on signature requests, and the signature request does not expire.
    ///   - externalId: This can be used to reference an ID in an external system that the sign request is related to.
    ///   - isPhoneVerificationRequiredToView: Forces signers to verify a text message prior to viewing the document. You must specify the phone number of signers to have this setting apply to them.
    ///   - templateId: When a signature request is created from a template this field will indicate the id of that template.
    ///   - type: object type
    ///   - sourceFiles: List of files to create a signing document from. This is currently limited to ten files. Only the ID and type fields are required for each file.
    ///   - signers: Array of signers for the signature request.
    ///   - signatureColor: Force a specific color for the signature (blue, black, or red).
    ///   - id: Box Sign request ID.
    ///   - prepareUrl: This URL is returned if `is_document_preparation_needed` is
    ///     set to `true` for Box Sign request. It is used to prepare a signature request
    ///     using the UI. The signature request is not sent until the preparation
    ///     phase is complete.
    ///   - signingLog: 
    ///   - status: Describes the status of the signature request.
    ///   - signFiles: List of files that will be signed, which are copies of the original
    ///     source files. A new version of these files are created as signers sign
    ///     and can be downloaded at any point in the signing process.
    ///   - autoExpireAt: Uses `days_valid` to calculate the date and time, in GMT, the sign request will expire if unsigned.
    ///   - parentFolder: 
    public init(isDocumentPreparationNeeded: Bool? = nil, redirectUrl: String? = nil, declinedRedirectUrl: String? = nil, areTextSignaturesEnabled: Bool? = nil, emailSubject: String? = nil, emailMessage: String? = nil, areRemindersEnabled: Bool? = nil, name: String? = nil, prefillTags: [SignRequestPrefillTag]? = nil, daysValid: Int64? = nil, externalId: String? = nil, isPhoneVerificationRequiredToView: Bool? = nil, templateId: String? = nil, type: SignRequestTypeField? = nil, sourceFiles: [FileBase]? = nil, signers: [SignRequestSigner]? = nil, signatureColor: String? = nil, id: String? = nil, prepareUrl: String? = nil, signingLog: FileMini? = nil, status: SignRequestStatusField? = nil, signFiles: SignRequestSignFilesField? = nil, autoExpireAt: Date? = nil, parentFolder: FolderMini? = nil) {
        self.type = type
        self.sourceFiles = sourceFiles
        self.signers = signers
        self.signatureColor = signatureColor
        self.id = id
        self.prepareUrl = prepareUrl
        self.signingLog = signingLog
        self.status = status
        self.signFiles = signFiles
        self.autoExpireAt = autoExpireAt
        self.parentFolder = parentFolder

        super.init(isDocumentPreparationNeeded: isDocumentPreparationNeeded, redirectUrl: redirectUrl, declinedRedirectUrl: declinedRedirectUrl, areTextSignaturesEnabled: areTextSignaturesEnabled, emailSubject: emailSubject, emailMessage: emailMessage, areRemindersEnabled: areRemindersEnabled, name: name, prefillTags: prefillTags, daysValid: daysValid, externalId: externalId, isPhoneVerificationRequiredToView: isPhoneVerificationRequiredToView, templateId: templateId)
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(SignRequestTypeField.self, forKey: .type)
        sourceFiles = try container.decodeIfPresent([FileBase].self, forKey: .sourceFiles)
        signers = try container.decodeIfPresent([SignRequestSigner].self, forKey: .signers)
        signatureColor = try container.decodeIfPresent(String.self, forKey: .signatureColor)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        prepareUrl = try container.decodeIfPresent(String.self, forKey: .prepareUrl)
        signingLog = try container.decodeIfPresent(FileMini.self, forKey: .signingLog)
        status = try container.decodeIfPresent(SignRequestStatusField.self, forKey: .status)
        signFiles = try container.decodeIfPresent(SignRequestSignFilesField.self, forKey: .signFiles)
        if let _autoExpireAt = try container.decodeIfPresent(String.self, forKey: .autoExpireAt) {
            autoExpireAt = try Utils.Dates.dateTimeFromString(dateTime: _autoExpireAt)
        } else {
            autoExpireAt = nil
        }

        parentFolder = try container.decodeIfPresent(FolderMini.self, forKey: .parentFolder)

        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(sourceFiles, forKey: .sourceFiles)
        try container.encodeIfPresent(signers, forKey: .signers)
        try container.encodeIfPresent(signatureColor, forKey: .signatureColor)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(prepareUrl, forKey: .prepareUrl)
        try container.encodeIfPresent(signingLog, forKey: .signingLog)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(signFiles, forKey: .signFiles)
        if let autoExpireAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: autoExpireAt), forKey: .autoExpireAt)
        }

        try container.encodeIfPresent(parentFolder, forKey: .parentFolder)
        try super.encode(to: encoder)
    }

}
