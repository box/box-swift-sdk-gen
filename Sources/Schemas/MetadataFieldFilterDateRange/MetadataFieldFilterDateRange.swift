import Foundation

/// Specifies which `date` field on the template to filter the search
/// results by, specifying a range of dates that can match.
public class MetadataFieldFilterDateRange: Codable {
    private enum CodingKeys: String, CodingKey {
        case lt
        case gt
    }

    /// Specifies the (inclusive) upper bound for the metadata field
    /// value. The value of a field must be lower than (`lt`) or
    /// equal to this value for the search query to match this
    /// template.
    public let lt: Date?

    /// Specifies the (inclusive) lower bound for the metadata field
    /// value. The value of a field must be greater than (`gt`) or
    /// equal to this value for the search query to match this
    /// template.
    public let gt: Date?

    /// Initializer for a MetadataFieldFilterDateRange.
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
    public init(lt: Date? = nil, gt: Date? = nil) {
        self.lt = lt
        self.gt = gt
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let _lt = try container.decodeIfPresent(String.self, forKey: .lt) {
            lt = try Utils.Dates.dateTimeFromString(dateTime: _lt)
        } else {
            lt = nil
        }

        if let _gt = try container.decodeIfPresent(String.self, forKey: .gt) {
            gt = try Utils.Dates.dateTimeFromString(dateTime: _gt)
        } else {
            gt = nil
        }

    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if let lt = lt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: lt), forKey: .lt)
        }

        if let gt = gt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: gt), forKey: .gt)
        }

    }

}
