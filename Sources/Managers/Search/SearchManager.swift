import Foundation

public class SearchManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func createMetadataQueryExecuteRead(requestBody: MetadataQuery, headers: CreateMetadataQueryExecuteReadHeadersArg = CreateMetadataQueryExecuteReadHeadersArg()) async throws -> MetadataQueryResults {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_queries/execute_read")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataQueryResults.deserialize(from: response.text)
    }

    public func getMetadataQueryIndices(queryParams: GetMetadataQueryIndicesQueryParamsArg, headers: GetMetadataQueryIndicesHeadersArg = GetMetadataQueryIndicesHeadersArg()) async throws -> MetadataQueryIndices {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["scope": Utils.Strings.toString(value: queryParams.scope), "template_key": Utils.Strings.toString(value: queryParams.templateKey)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_query_indices")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataQueryIndices.deserialize(from: response.text)
    }

    public func getSearch(queryParams: GetSearchQueryParamsArg = GetSearchQueryParamsArg(), headers: GetSearchHeadersArg = GetSearchHeadersArg()) async throws -> SearchResultsOrSearchResultsWithSharedLinks {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["query": Utils.Strings.toString(value: queryParams.query), "scope": Utils.Strings.toString(value: queryParams.scope), "file_extensions": Utils.Strings.toString(value: queryParams.fileExtensions), "created_at_range": Utils.Strings.toString(value: queryParams.createdAtRange), "updated_at_range": Utils.Strings.toString(value: queryParams.updatedAtRange), "size_range": Utils.Strings.toString(value: queryParams.sizeRange), "owner_user_ids": Utils.Strings.toString(value: queryParams.ownerUserIds), "recent_updater_user_ids": Utils.Strings.toString(value: queryParams.recentUpdaterUserIds), "ancestor_folder_ids": Utils.Strings.toString(value: queryParams.ancestorFolderIds), "content_types": Utils.Strings.toString(value: queryParams.contentTypes), "type": Utils.Strings.toString(value: queryParams.type), "trash_content": Utils.Strings.toString(value: queryParams.trashContent), "mdfilters": Utils.Strings.toString(value: queryParams.mdfilters), "sort": Utils.Strings.toString(value: queryParams.sort), "direction": Utils.Strings.toString(value: queryParams.direction), "limit": Utils.Strings.toString(value: queryParams.limit), "include_recent_shared_links": Utils.Strings.toString(value: queryParams.includeRecentSharedLinks), "fields": Utils.Strings.toString(value: queryParams.fields), "offset": Utils.Strings.toString(value: queryParams.offset), "deleted_user_ids": Utils.Strings.toString(value: queryParams.deletedUserIds), "deleted_at_range": Utils.Strings.toString(value: queryParams.deletedAtRange)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/search")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SearchResultsOrSearchResultsWithSharedLinks.deserialize(from: response.text)
    }

}
