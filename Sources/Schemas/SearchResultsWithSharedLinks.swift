import Foundation

/// A list of files, folders and web links that matched the search query,
/// including the additional information about any shared links through
/// which the item has been shared with the user.
/// 
/// This response format is only returned when the `include_recent_shared_links`
/// query parameter has been set to `true`.
public class SearchResultsWithSharedLinks: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case totalCount = "total_count"
        case limit
        case offset
        case entries
    }

    /// Specifies the response as search result items with shared links
    public let type: SearchResultsWithSharedLinksTypeField

    /// One greater than the offset of the last entry in the search results.
    /// The total number of entries in the collection may be less than
    /// `total_count`.
    public let totalCount: Int64?

    /// The limit that was used for this search. This will be the same as the
    /// `limit` query parameter unless that value exceeded the maximum value
    /// allowed.
    public let limit: Int64?

    /// The 0-based offset of the first entry in this set. This will be the same
    /// as the `offset` query parameter used.
    public let offset: Int64?

    /// The search results for the query provided, including the
    /// additional information about any shared links through
    /// which the item has been shared with the user.
    public let entries: [SearchResultWithSharedLink]?

    /// Initializer for a SearchResultsWithSharedLinks.
    ///
    /// - Parameters:
    ///   - type: Specifies the response as search result items with shared links
    ///   - totalCount: One greater than the offset of the last entry in the search results.
    ///     The total number of entries in the collection may be less than
    ///     `total_count`.
    ///   - limit: The limit that was used for this search. This will be the same as the
    ///     `limit` query parameter unless that value exceeded the maximum value
    ///     allowed.
    ///   - offset: The 0-based offset of the first entry in this set. This will be the same
    ///     as the `offset` query parameter used.
    ///   - entries: The search results for the query provided, including the
    ///     additional information about any shared links through
    ///     which the item has been shared with the user.
    public init(type: SearchResultsWithSharedLinksTypeField, totalCount: Int64? = nil, limit: Int64? = nil, offset: Int64? = nil, entries: [SearchResultWithSharedLink]? = nil) {
        self.type = type
        self.totalCount = totalCount
        self.limit = limit
        self.offset = offset
        self.entries = entries
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(SearchResultsWithSharedLinksTypeField.self, forKey: .type)
        totalCount = try container.decodeIfPresent(Int64.self, forKey: .totalCount)
        limit = try container.decodeIfPresent(Int64.self, forKey: .limit)
        offset = try container.decodeIfPresent(Int64.self, forKey: .offset)
        entries = try container.decodeIfPresent([SearchResultWithSharedLink].self, forKey: .entries)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(totalCount, forKey: .totalCount)
        try container.encodeIfPresent(limit, forKey: .limit)
        try container.encodeIfPresent(offset, forKey: .offset)
        try container.encodeIfPresent(entries, forKey: .entries)
    }

}
