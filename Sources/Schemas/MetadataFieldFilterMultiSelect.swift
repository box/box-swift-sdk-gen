import Foundation

/// Specifies the values to match for a `multiSelect` metadata
/// field. When performing a search, the query will essentially
/// perform an `OR` operation to match any template where any of
/// the provided values match this field.
public typealias MetadataFieldFilterMultiSelect = [String: [String]]
