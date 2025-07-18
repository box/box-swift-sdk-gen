import Foundation

/// A list of event objects.
public class Events: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case chunkSize = "chunk_size"
        case nextStreamPosition = "next_stream_position"
        case entries
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// The number of events returned in this response.
    public let chunkSize: Int64?

    /// The stream position of the start of the next page (chunk)
    /// of events.
    public let nextStreamPosition: EventsNextStreamPositionField?

    /// A list of events.
    public let entries: [Event]?

    /// Initializer for a Events.
    ///
    /// - Parameters:
    ///   - chunkSize: The number of events returned in this response.
    ///   - nextStreamPosition: The stream position of the start of the next page (chunk)
    ///     of events.
    ///   - entries: A list of events.
    public init(chunkSize: Int64? = nil, nextStreamPosition: EventsNextStreamPositionField? = nil, entries: [Event]? = nil) {
        self.chunkSize = chunkSize
        self.nextStreamPosition = nextStreamPosition
        self.entries = entries
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        chunkSize = try container.decodeIfPresent(Int64.self, forKey: .chunkSize)
        nextStreamPosition = try container.decodeIfPresent(EventsNextStreamPositionField.self, forKey: .nextStreamPosition)
        entries = try container.decodeIfPresent([Event].self, forKey: .entries)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(chunkSize, forKey: .chunkSize)
        try container.encodeIfPresent(nextStreamPosition, forKey: .nextStreamPosition)
        try container.encodeIfPresent(entries, forKey: .entries)
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
