import Foundation

public class SignTemplateReadySignLinkField: Codable {
    private enum CodingKeys: String, CodingKey {
        case url
        case name
        case instructions
        case folderId = "folder_id"
        case isNotificationDisabled = "is_notification_disabled"
        case isActive = "is_active"
    }

    /// The URL that can be sent to signers.,
    public let url: String?
    /// Request name.,
    public let name: String?
    /// Extra instructions for all signers.,
    public let instructions: String?
    /// The destination folder to place final,
    /// signed document and signing
    /// log. Only `ID` and `type` fields are required.
    /// The root folder,
    /// folder ID `0`, cannot be used.,
    public let folderId: String?
    /// Whether to disable notifications when
    /// a signer has signed.,
    public let isNotificationDisabled: Bool?
    /// Whether the ready sign link is enabled or not.,
    public let isActive: Bool?

    /// Initializer for a SignTemplateReadySignLinkField.
    ///
    /// - Parameters:
    ///   - url: The URL that can be sent to signers.
    ///   - name: Request name.
    ///   - instructions: Extra instructions for all signers.
    ///   - folderId: The destination folder to place final,
    ///     signed document and signing
    ///     log. Only `ID` and `type` fields are required.
    ///     The root folder,
    ///     folder ID `0`, cannot be used.
    ///   - isNotificationDisabled: Whether to disable notifications when
    ///     a signer has signed.
    ///   - isActive: Whether the ready sign link is enabled or not.
    public init(url: String? = nil, name: String? = nil, instructions: String? = nil, folderId: String? = nil, isNotificationDisabled: Bool? = nil, isActive: Bool? = nil) {
        self.url = url
        self.name = name
        self.instructions = instructions
        self.folderId = folderId
        self.isNotificationDisabled = isNotificationDisabled
        self.isActive = isActive
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        instructions = try container.decodeIfPresent(String.self, forKey: .instructions)
        folderId = try container.decodeIfPresent(String.self, forKey: .folderId)
        isNotificationDisabled = try container.decodeIfPresent(Bool.self, forKey: .isNotificationDisabled)
        isActive = try container.decodeIfPresent(Bool.self, forKey: .isActive)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(instructions, forKey: .instructions)
        try container.encodeIfPresent(folderId, forKey: .folderId)
        try container.encodeIfPresent(isNotificationDisabled, forKey: .isNotificationDisabled)
        try container.encodeIfPresent(isActive, forKey: .isActive)
    }
}
