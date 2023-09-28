import Foundation

public enum SearchResultsOrSearchResultsWithSharedLinks: Codable {
    case searchResults(SearchResults)
    case searchResultsWithSharedLinks(SearchResultsWithSharedLinks)

    private enum DeterminerCodingKey: String, CodingKey {
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DeterminerCodingKey.self)
        if let type = try? container.decode(String.self, forKey: .type) {
            switch type {
            case "search_results_items":
                if let content = try? SearchResults(from: decoder) {
                    self = .searchResults(content)
                    return
                }
            case "search_results_with_shared_links":
                if let content = try? SearchResultsWithSharedLinks(from: decoder) {
                    self = .searchResultsWithSharedLinks(content)
                    return
                }
            default:
                throw DecodingError.typeMismatch(SearchResultsOrSearchResultsWithSharedLinks.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The Decoded object contains an unexpeted value for key type"))
            }
        }

        throw DecodingError.keyNotFound(DeterminerCodingKey.type, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "The Decoded object doesn't contain entry with type key"))
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
        case .searchResults(let searchResults):
            try searchResults.encode(to: encoder)
        case .searchResultsWithSharedLinks(let searchResultsWithSharedLinks):
            try searchResultsWithSharedLinks.encode(to: encoder)
        }
    }
}
