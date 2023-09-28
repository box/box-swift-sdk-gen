import Foundation

public class MetadataCascadePolicies: Codable {
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
    /// A list of metadata cascade policies,
    public let entries: [MetadataCascadePolicy]?

    /// Initializer for a MetadataCascadePolicies.
    ///
    /// - Parameters:
    ///   - limit: The limit that was used for these entries. This will be the same as the
    ///     `limit` query parameter unless that value exceeded the maximum value
    ///     allowed. The maximum value varies by API.
    ///   - nextMarker: The marker for the start of the next page of results.
    ///   - prevMarker: The marker for the start of the previous page of results.
    ///   - entries: A list of metadata cascade policies
    public init(limit: Int64? = nil, nextMarker: Int64? = nil, prevMarker: Int64? = nil, entries: [MetadataCascadePolicy]? = nil) {
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
        entries = try container.decodeIfPresent([MetadataCascadePolicy].self, forKey: .entries)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(limit, forKey: .limit)
        try container.encodeIfPresent(nextMarker, forKey: .nextMarker)
        try container.encodeIfPresent(prevMarker, forKey: .prevMarker)
        try container.encodeIfPresent(entries, forKey: .entries)
    }
}
