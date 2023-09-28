import Foundation

public class MetadataFieldFilterDateRangeMapValue: Codable {
    private enum CodingKeys: String, CodingKey {
        case lt
        case gt
    }

    /// Specifies the (inclusive) upper bound for the metadata field
    /// value. The value of a field must be lower than (`lt`) or
    /// equal to this value for the search query to match this
    /// template.,
    public let lt: String?
    /// Specifies the (inclusive) lower bound for the metadata field
    /// value. The value of a field must be greater than (`gt`) or
    /// equal to this value for the search query to match this
    /// template.,
    public let gt: String?

    /// Initializer for a MetadataFieldFilterDateRangeMapValue.
    ///
    /// - Parameters:
    ///   - lt: Specifies the (inclusive) upper bound for the metadata field
    ///     value. The value of a field must be lower than (`lt`) or
    ///     equal to this value for the search query to match this
    ///     template.
    ///   - gt: Specifies the (inclusive) lower bound for the metadata field
    ///     value. The value of a field must be greater than (`gt`) or
    ///     equal to this value for the search query to match this
    ///     template.
    public init(lt: String? = nil, gt: String? = nil) {
        self.lt = lt
        self.gt = gt
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        lt = try container.decodeIfPresent(String.self, forKey: .lt)
        gt = try container.decodeIfPresent(String.self, forKey: .gt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(lt, forKey: .lt)
        try container.encodeIfPresent(gt, forKey: .gt)
    }
}
