import Foundation

/// A collection of metadata query indices.
public class MetadataQueryIndices: Codable {
    private enum CodingKeys: String, CodingKey {
        case entries
        case limit
        case nextMarker = "next_marker"
    }

    /// A collection of metadata query indices.
    public let entries: [MetadataQueryIndex]?
    /// The limit that was used for this request.
    public let limit: Int64?
    /// The marker for the start of the next page of results.
    public let nextMarker: String?

    /// Initializer for a MetadataQueryIndices.
    ///
    /// - Parameters:
    ///   - entries: A collection of metadata query indices.
    ///   - limit: The limit that was used for this request.
    ///   - nextMarker: The marker for the start of the next page of results.
    public init(entries: [MetadataQueryIndex]? = nil, limit: Int64? = nil, nextMarker: String? = nil) {
        self.entries = entries
        self.limit = limit
        self.nextMarker = nextMarker
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        entries = try container.decodeIfPresent([MetadataQueryIndex].self, forKey: .entries)
        limit = try container.decodeIfPresent(Int64.self, forKey: .limit)
        nextMarker = try container.decodeIfPresent(String.self, forKey: .nextMarker)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(entries, forKey: .entries)
        try container.encodeIfPresent(limit, forKey: .limit)
        try container.encodeIfPresent(nextMarker, forKey: .nextMarker)
    }
}
