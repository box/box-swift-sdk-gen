import Foundation

/// A list of collaborations.
public class CollaborationsOffsetPaginated: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case limit
        case offset
        case entries
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// One greater than the offset of the last entry in the entire collection.
    /// The total number of entries in the collection may be less than
    /// `total_count`.
    /// 
    /// This field is only returned for calls that use offset-based pagination.
    /// For marker-based paginated APIs, this field will be omitted.
    public let totalCount: Int64?

    /// The limit that was used for these entries. This will be the same as the
    /// `limit` query parameter unless that value exceeded the maximum value
    /// allowed. The maximum value varies by API.
    public let limit: Int64?

    /// The 0-based offset of the first entry in this set. This will be the same
    /// as the `offset` query parameter.
    /// 
    /// This field is only returned for calls that use offset-based pagination.
    /// For marker-based paginated APIs, this field will be omitted.
    public let offset: Int64?

    /// A list of collaborations.
    public let entries: [Collaboration]?

    /// Initializer for a CollaborationsOffsetPaginated.
    ///
    /// - Parameters:
    ///   - totalCount: One greater than the offset of the last entry in the entire collection.
    ///     The total number of entries in the collection may be less than
    ///     `total_count`.
    ///     
    ///     This field is only returned for calls that use offset-based pagination.
    ///     For marker-based paginated APIs, this field will be omitted.
    ///   - limit: The limit that was used for these entries. This will be the same as the
    ///     `limit` query parameter unless that value exceeded the maximum value
    ///     allowed. The maximum value varies by API.
    ///   - offset: The 0-based offset of the first entry in this set. This will be the same
    ///     as the `offset` query parameter.
    ///     
    ///     This field is only returned for calls that use offset-based pagination.
    ///     For marker-based paginated APIs, this field will be omitted.
    ///   - entries: A list of collaborations.
    public init(totalCount: Int64? = nil, limit: Int64? = nil, offset: Int64? = nil, entries: [Collaboration]? = nil) {
        self.totalCount = totalCount
        self.limit = limit
        self.offset = offset
        self.entries = entries
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        totalCount = try container.decodeIfPresent(Int64.self, forKey: .totalCount)
        limit = try container.decodeIfPresent(Int64.self, forKey: .limit)
        offset = try container.decodeIfPresent(Int64.self, forKey: .offset)
        entries = try container.decodeIfPresent([Collaboration].self, forKey: .entries)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(totalCount, forKey: .totalCount)
        try container.encodeIfPresent(limit, forKey: .limit)
        try container.encodeIfPresent(offset, forKey: .offset)
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
