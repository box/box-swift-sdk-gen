import Foundation

/// A recent item accessed by a user.
public class RecentItem: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case type
        case item
        case interactionType = "interaction_type"
        case interactedAt = "interacted_at"
        case interactionSharedLink = "interaction_shared_link"
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// The value will always be `recent_item`.
    public let type: String?

    public let item: FileFullOrFolderFullOrWebLink?

    /// The most recent type of access the user performed on
    /// the item.
    public let interactionType: RecentItemInteractionTypeField?

    /// The time of the most recent interaction.
    public let interactedAt: Date?

    /// If the item was accessed through a shared link it will appear here,
    /// otherwise this will be null.
    public let interactionSharedLink: String?

    /// Initializer for a RecentItem.
    ///
    /// - Parameters:
    ///   - type: The value will always be `recent_item`.
    ///   - item: 
    ///   - interactionType: The most recent type of access the user performed on
    ///     the item.
    ///   - interactedAt: The time of the most recent interaction.
    ///   - interactionSharedLink: If the item was accessed through a shared link it will appear here,
    ///     otherwise this will be null.
    public init(type: String? = nil, item: FileFullOrFolderFullOrWebLink? = nil, interactionType: RecentItemInteractionTypeField? = nil, interactedAt: Date? = nil, interactionSharedLink: String? = nil) {
        self.type = type
        self.item = item
        self.interactionType = interactionType
        self.interactedAt = interactedAt
        self.interactionSharedLink = interactionSharedLink
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        item = try container.decodeIfPresent(FileFullOrFolderFullOrWebLink.self, forKey: .item)
        interactionType = try container.decodeIfPresent(RecentItemInteractionTypeField.self, forKey: .interactionType)
        interactedAt = try container.decodeDateTimeIfPresent(forKey: .interactedAt)
        interactionSharedLink = try container.decodeIfPresent(String.self, forKey: .interactionSharedLink)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(item, forKey: .item)
        try container.encodeIfPresent(interactionType, forKey: .interactionType)
        try container.encodeDateTimeIfPresent(field: interactedAt, forKey: .interactedAt)
        try container.encodeIfPresent(interactionSharedLink, forKey: .interactionSharedLink)
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
