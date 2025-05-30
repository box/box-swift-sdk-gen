import Foundation

public class TimelineSkillCardEntriesField: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case text
        case appears
        case imageUrl = "image_url"
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// The text of the entry. This would be the display
    /// name for an item being placed on the timeline, for example the name
    /// of the person who was detected in a video.
    public let text: String?

    /// Defines a list of timestamps for when this item should appear on the
    /// timeline.
    public let appears: [TimelineSkillCardEntriesAppearsField]?

    /// The image to show on a for an entry that appears
    /// on a timeline. This image URL is required for every entry.
    /// 
    /// The image will be shown in a
    /// list of items (for example faces), and clicking
    /// the image will show the user where that entry
    /// appears during the duration of this entry.
    public let imageUrl: String?

    /// Initializer for a TimelineSkillCardEntriesField.
    ///
    /// - Parameters:
    ///   - text: The text of the entry. This would be the display
    ///     name for an item being placed on the timeline, for example the name
    ///     of the person who was detected in a video.
    ///   - appears: Defines a list of timestamps for when this item should appear on the
    ///     timeline.
    ///   - imageUrl: The image to show on a for an entry that appears
    ///     on a timeline. This image URL is required for every entry.
    ///     
    ///     The image will be shown in a
    ///     list of items (for example faces), and clicking
    ///     the image will show the user where that entry
    ///     appears during the duration of this entry.
    public init(text: String? = nil, appears: [TimelineSkillCardEntriesAppearsField]? = nil, imageUrl: String? = nil) {
        self.text = text
        self.appears = appears
        self.imageUrl = imageUrl
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        text = try container.decodeIfPresent(String.self, forKey: .text)
        appears = try container.decodeIfPresent([TimelineSkillCardEntriesAppearsField].self, forKey: .appears)
        imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(appears, forKey: .appears)
        try container.encodeIfPresent(imageUrl, forKey: .imageUrl)
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
