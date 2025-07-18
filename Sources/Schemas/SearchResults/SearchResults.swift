import Foundation

/// A list of files, folders and web links that matched the search query.
public class SearchResults: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case limit
        case offset
        case type
        case entries
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


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

    /// Specifies the response as search result items without shared links.
    public let type: SearchResultsTypeField

    /// The search results for the query provided.
    public let entries: [FileFullOrFolderFullOrWebLink]?

    /// Initializer for a SearchResults.
    ///
    /// - Parameters:
    ///   - totalCount: One greater than the offset of the last entry in the search results.
    ///     The total number of entries in the collection may be less than
    ///     `total_count`.
    ///   - limit: The limit that was used for this search. This will be the same as the
    ///     `limit` query parameter unless that value exceeded the maximum value
    ///     allowed.
    ///   - offset: The 0-based offset of the first entry in this set. This will be the same
    ///     as the `offset` query parameter used.
    ///   - type: Specifies the response as search result items without shared links.
    ///   - entries: The search results for the query provided.
    public init(totalCount: Int64? = nil, limit: Int64? = nil, offset: Int64? = nil, type: SearchResultsTypeField = SearchResultsTypeField.searchResultsItems, entries: [FileFullOrFolderFullOrWebLink]? = nil) {
        self.totalCount = totalCount
        self.limit = limit
        self.offset = offset
        self.type = type
        self.entries = entries
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        totalCount = try container.decodeIfPresent(Int64.self, forKey: .totalCount)
        limit = try container.decodeIfPresent(Int64.self, forKey: .limit)
        offset = try container.decodeIfPresent(Int64.self, forKey: .offset)
        type = try container.decode(SearchResultsTypeField.self, forKey: .type)
        entries = try container.decodeIfPresent([FileFullOrFolderFullOrWebLink].self, forKey: .entries)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(totalCount, forKey: .totalCount)
        try container.encodeIfPresent(limit, forKey: .limit)
        try container.encodeIfPresent(offset, forKey: .offset)
        try container.encode(type, forKey: .type)
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
