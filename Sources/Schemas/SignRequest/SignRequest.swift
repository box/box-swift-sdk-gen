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
        case collaboratorLevel = "collaborator_level"
        case senderEmail = "sender_email"
        case senderId = "sender_id"
    }

    /// object type
    public let type: SignRequestTypeField?

    /// List of files to create a signing document from. This is currently limited to ten files. Only the ID and type fields are required for each file.
    public let sourceFiles: [FileBase]?

    /// Array of signers for the signature request.
    public let signers: [SignRequestSigner]?

    /// Force a specific color for the signature (blue, black, or red).
    @CodableTriState public private(set) var signatureColor: String?

    /// Box Sign request ID.
    public let id: String?

    /// This URL is returned if `is_document_preparation_needed` is
    /// set to `true` in the request. The parameter is used to prepare
    /// the signature request
    /// using the UI. The signature request is not
    /// sent until the preparation
    /// phase is complete.
    @CodableTriState public private(set) var prepareUrl: String?

    public let signingLog: FileMini?

    /// Describes the status of the signature request.
    public let status: SignRequestStatusField?

    /// List of files that will be signed, which are copies of the original
    /// source files. A new version of these files are created as signers sign
    /// and can be downloaded at any point in the signing process.
    public let signFiles: SignRequestSignFilesField?

    /// Uses `days_valid` to calculate the date and time, in GMT, the sign request will expire if unsigned.
    @CodableTriState public private(set) var autoExpireAt: Date?

    public let parentFolder: FolderMini?

    /// The collaborator level of the user to the sign request. Values can include "owner", "editor", and "viewer"
    @CodableTriState public private(set) var collaboratorLevel: String?

    /// The email address of the sender of the sign request.
    @CodableTriState public private(set) var senderEmail: String?

    /// The user ID of the sender of the sign request.
    @CodableTriState public private(set) var senderId: Int64?

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
    ///   - templateId: When a signature request is created from a template this field will indicate the id of that template.
    ///   - externalSystemName: Used as an optional system name to appear in the signature log next to the signers who have been assigned the `embed_url_external_id`.
    ///   - type: object type
    ///   - sourceFiles: List of files to create a signing document from. This is currently limited to ten files. Only the ID and type fields are required for each file.
    ///   - signers: Array of signers for the signature request.
    ///   - signatureColor: Force a specific color for the signature (blue, black, or red).
    ///   - id: Box Sign request ID.
    ///   - prepareUrl: This URL is returned if `is_document_preparation_needed` is
    ///     set to `true` in the request. The parameter is used to prepare
    ///     the signature request
    ///     using the UI. The signature request is not
    ///     sent until the preparation
    ///     phase is complete.
    ///   - signingLog: 
    ///   - status: Describes the status of the signature request.
    ///   - signFiles: List of files that will be signed, which are copies of the original
    ///     source files. A new version of these files are created as signers sign
    ///     and can be downloaded at any point in the signing process.
    ///   - autoExpireAt: Uses `days_valid` to calculate the date and time, in GMT, the sign request will expire if unsigned.
    ///   - parentFolder: 
    ///   - collaboratorLevel: The collaborator level of the user to the sign request. Values can include "owner", "editor", and "viewer"
    ///   - senderEmail: The email address of the sender of the sign request.
    ///   - senderId: The user ID of the sender of the sign request.
    public init(isDocumentPreparationNeeded: Bool? = nil, redirectUrl: TriStateField<String> = nil, declinedRedirectUrl: TriStateField<String> = nil, areTextSignaturesEnabled: Bool? = nil, emailSubject: TriStateField<String> = nil, emailMessage: TriStateField<String> = nil, areRemindersEnabled: Bool? = nil, name: String? = nil, prefillTags: [SignRequestPrefillTag]? = nil, daysValid: TriStateField<Int64> = nil, externalId: TriStateField<String> = nil, templateId: TriStateField<String> = nil, externalSystemName: TriStateField<String> = nil, type: SignRequestTypeField? = nil, sourceFiles: [FileBase]? = nil, signers: [SignRequestSigner]? = nil, signatureColor: TriStateField<String> = nil, id: String? = nil, prepareUrl: TriStateField<String> = nil, signingLog: FileMini? = nil, status: SignRequestStatusField? = nil, signFiles: SignRequestSignFilesField? = nil, autoExpireAt: TriStateField<Date> = nil, parentFolder: FolderMini? = nil, collaboratorLevel: TriStateField<String> = nil, senderEmail: TriStateField<String> = nil, senderId: TriStateField<Int64> = nil) {
        self.type = type
        self.sourceFiles = sourceFiles
        self.signers = signers
        self._signatureColor = CodableTriState(state: signatureColor)
        self.id = id
        self._prepareUrl = CodableTriState(state: prepareUrl)
        self.signingLog = signingLog
        self.status = status
        self.signFiles = signFiles
        self._autoExpireAt = CodableTriState(state: autoExpireAt)
        self.parentFolder = parentFolder
        self._collaboratorLevel = CodableTriState(state: collaboratorLevel)
        self._senderEmail = CodableTriState(state: senderEmail)
        self._senderId = CodableTriState(state: senderId)

        super.init(isDocumentPreparationNeeded: isDocumentPreparationNeeded, redirectUrl: redirectUrl, declinedRedirectUrl: declinedRedirectUrl, areTextSignaturesEnabled: areTextSignaturesEnabled, emailSubject: emailSubject, emailMessage: emailMessage, areRemindersEnabled: areRemindersEnabled, name: name, prefillTags: prefillTags, daysValid: daysValid, externalId: externalId, templateId: templateId, externalSystemName: externalSystemName)
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
        autoExpireAt = try container.decodeDateTimeIfPresent(forKey: .autoExpireAt)
        parentFolder = try container.decodeIfPresent(FolderMini.self, forKey: .parentFolder)
        collaboratorLevel = try container.decodeIfPresent(String.self, forKey: .collaboratorLevel)
        senderEmail = try container.decodeIfPresent(String.self, forKey: .senderEmail)
        senderId = try container.decodeIfPresent(Int64.self, forKey: .senderId)

        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(sourceFiles, forKey: .sourceFiles)
        try container.encodeIfPresent(signers, forKey: .signers)
        try container.encode(field: _signatureColor.state, forKey: .signatureColor)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encode(field: _prepareUrl.state, forKey: .prepareUrl)
        try container.encodeIfPresent(signingLog, forKey: .signingLog)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(signFiles, forKey: .signFiles)
        try container.encodeDateTime(field: _autoExpireAt.state, forKey: .autoExpireAt)
        try container.encodeIfPresent(parentFolder, forKey: .parentFolder)
        try container.encode(field: _collaboratorLevel.state, forKey: .collaboratorLevel)
        try container.encode(field: _senderEmail.state, forKey: .senderEmail)
        try container.encode(field: _senderId.state, forKey: .senderId)
        try super.encode(to: encoder)
    }

}
