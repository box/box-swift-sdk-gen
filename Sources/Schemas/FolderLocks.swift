import Foundation

public class FolderLocks: Codable {
    private enum CodingKeys: String, CodingKey {
        case limit
        case nextMarker = "next_marker"
        case prevMarker = "prev_marker"
        case entries
    }

    /// The limit that was used for these entries. This will be the same as the
    /// `limit` query parameter unless that value exceeded the maximum value
    /// allowed. The maximum value varies by API.,
    public let limit: Int64?
    /// The marker for the start of the next page of results.,
    public let nextMarker: Int64?
    /// The marker for the start of the previous page of results.,
    public let prevMarker: Int64?
    /// A list of folder locks,
    public let entries: [FolderLock]?

    /// Initializer for a FolderLocks.
    ///
    /// - Parameters:
    ///   - limit: The limit that was used for these entries. This will be the same as the
    ///     `limit` query parameter unless that value exceeded the maximum value
    ///     allowed. The maximum value varies by API.
    ///   - nextMarker: The marker for the start of the next page of results.
    ///   - prevMarker: The marker for the start of the previous page of results.
    ///   - entries: A list of folder locks
    public init(limit: Int64? = nil, nextMarker: Int64? = nil, prevMarker: Int64? = nil, entries: [FolderLock]? = nil) {
        self.limit = limit
        self.nextMarker = nextMarker
        self.prevMarker = prevMarker
        self.entries = entries
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        limit = try container.decodeIfPresent(Int64.self, forKey: .limit)
        nextMarker = try container.decodeIfPresent(Int64.self, forKey: .nextMarker)
        prevMarker = try container.decodeIfPresent(Int64.self, forKey: .prevMarker)
        entries = try container.decodeIfPresent([FolderLock].self, forKey: .entries)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(limit, forKey: .limit)
        try container.encodeIfPresent(nextMarker, forKey: .nextMarker)
        try container.encodeIfPresent(prevMarker, forKey: .prevMarker)
        try container.encodeIfPresent(entries, forKey: .entries)
    }
}
