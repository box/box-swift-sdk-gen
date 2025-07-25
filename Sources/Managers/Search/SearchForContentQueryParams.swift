import Foundation

public class SearchForContentQueryParams {
    /// The string to search for. This query is matched against item names,
    /// descriptions, text content of files, and various other fields of
    /// the different item types.
    /// 
    /// This parameter supports a variety of operators to further refine
    /// the results returns.
    /// 
    /// * `""` - by wrapping a query in double quotes only exact matches are
    ///   returned by the API. Exact searches do not return search matches
    ///   based on specific character sequences. Instead, they return
    ///   matches based on phrases, that is, word sequences. For example:
    ///   A search for `"Blue-Box"` may return search results including
    ///   the sequence `"blue.box"`, `"Blue Box"`, and `"Blue-Box"`;
    ///   any item containing the words `Blue` and `Box` consecutively, in
    ///   the order specified.
    /// * `AND` - returns items that contain both the search terms. For
    ///   example, a search for `marketing AND BoxWorks` returns items
    ///   that have both `marketing` and `BoxWorks` within its text in any order.
    ///   It does not return a result that only has `BoxWorks` in its text.
    /// * `OR` - returns items that contain either of the search terms. For
    ///   example, a search for `marketing OR BoxWorks` returns a result that
    ///   has either `marketing` or `BoxWorks` within its text. Using this
    ///   operator is not necessary as we implicitly interpret multi-word
    ///   queries as `OR` unless another supported boolean term is used.
    /// * `NOT` - returns items that do not contain the search term provided.
    ///   For example, a search for `marketing AND NOT BoxWorks` returns a result
    ///   that has only `marketing` within its text. Results containing
    ///   `BoxWorks` are omitted.
    /// 
    /// We do not support lower case (that is,
    /// `and`, `or`, and `not`) or mixed case (that is, `And`, `Or`, and `Not`)
    /// operators.
    /// 
    /// This field is required unless the `mdfilters` parameter is defined.
    public let query: String?

    /// Limits the search results to either the files that the user has
    /// access to, or to files available to the entire enterprise.
    /// 
    /// The scope defaults to `user_content`, which limits the search
    /// results to content that is available to the currently authenticated
    /// user.
    /// 
    /// The `enterprise_content` can be requested by an admin through our
    /// support channels. Once this scope has been enabled for a user, it
    /// will allow that use to query for content across the entire
    /// enterprise and not only the content that they have access to.
    public let scope: SearchForContentQueryParamsScopeField?

    /// Limits the search results to any files that match any of the provided
    /// file extensions. This list is a comma-separated list of file extensions
    /// without the dots.
    public let fileExtensions: [String]?

    /// Limits the search results to any items created within
    /// a given date range.
    /// 
    /// Date ranges are defined as comma separated RFC3339
    /// timestamps.
    /// 
    /// If the the start date is omitted (`,2014-05-17T13:35:01-07:00`)
    /// anything created before the end date will be returned.
    /// 
    /// If the end date is omitted (`2014-05-15T13:35:01-07:00,`) the
    /// current date will be used as the end date instead.
    public let createdAtRange: [String]?

    /// Limits the search results to any items updated within
    /// a given date range.
    /// 
    /// Date ranges are defined as comma separated RFC3339
    /// timestamps.
    /// 
    /// If the start date is omitted (`,2014-05-17T13:35:01-07:00`)
    /// anything updated before the end date will be returned.
    /// 
    /// If the end date is omitted (`2014-05-15T13:35:01-07:00,`) the
    /// current date will be used as the end date instead.
    public let updatedAtRange: [String]?

    /// Limits the search results to any items with a size within
    /// a given file size range. This applied to files and folders.
    /// 
    /// Size ranges are defined as comma separated list of a lower
    /// and upper byte size limit (inclusive).
    /// 
    /// The upper and lower bound can be omitted to create open ranges.
    public let sizeRange: [Int64]?

    /// Limits the search results to any items that are owned
    /// by the given list of owners, defined as a list of comma separated
    /// user IDs.
    /// 
    /// The items still need to be owned or shared with
    /// the currently authenticated user for them to show up in the search
    /// results. If the user does not have access to any files owned by any of
    /// the users an empty result set will be returned.
    /// 
    /// To search across an entire enterprise, we recommend using the
    /// `enterprise_content` scope parameter which can be requested with our
    /// support team.
    public let ownerUserIds: [String]?

    /// Limits the search results to any items that have been updated
    /// by the given list of users, defined as a list of comma separated
    /// user IDs.
    /// 
    /// The items still need to be owned or shared with
    /// the currently authenticated user for them to show up in the search
    /// results. If the user does not have access to any files owned by any of
    /// the users an empty result set will be returned.
    /// 
    /// This feature only searches back to the last 10 versions of an item.
    public let recentUpdaterUserIds: [String]?

    /// Limits the search results to items within the given
    /// list of folders, defined as a comma separated lists
    /// of folder IDs.
    /// 
    /// Search results will also include items within any subfolders
    /// of those ancestor folders.
    /// 
    /// The folders still need to be owned or shared with
    /// the currently authenticated user. If the folder is not accessible by this
    /// user, or it does not exist, a `HTTP 404` error code will be returned
    /// instead.
    /// 
    /// To search across an entire enterprise, we recommend using the
    /// `enterprise_content` scope parameter which can be requested with our
    /// support team.
    public let ancestorFolderIds: [String]?

    /// Limits the search results to any items that match the search query
    /// for a specific part of the file, for example the file description.
    /// 
    /// Content types are defined as a comma separated lists
    /// of Box recognized content types. The allowed content types are as follows.
    /// 
    /// * `name` - The name of the item, as defined by its `name` field.
    /// * `description` - The description of the item, as defined by its
    ///   `description` field.
    /// * `file_content` - The actual content of the file.
    /// * `comments` - The content of any of the comments on a file or
    ///    folder.
    /// * `tags` - Any tags that are applied to an item, as defined by its
    ///    `tags` field.
    public let contentTypes: [SearchForContentQueryParamsContentTypesField]?

    /// Limits the search results to any items of this type. This
    /// parameter only takes one value. By default the API returns
    /// items that match any of these types.
    /// 
    /// * `file` - Limits the search results to files,
    /// * `folder` - Limits the search results to folders,
    /// * `web_link` - Limits the search results to web links, also known
    ///    as bookmarks.
    public let type: SearchForContentQueryParamsTypeField?

    /// Determines if the search should look in the trash for items.
    /// 
    /// By default, this API only returns search results for items
    /// not currently in the trash (`non_trashed_only`).
    /// 
    /// * `trashed_only` - Only searches for items currently in the trash
    /// * `non_trashed_only` - Only searches for items currently not in
    ///   the trash
    /// * `all_items` - Searches for both trashed and non-trashed items.
    public let trashContent: SearchForContentQueryParamsTrashContentField?

    /// Limits the search results to any items for which the metadata matches the provided filter.
    /// This parameter is a list that specifies exactly **one** metadata template used to filter the search results. 
    /// The parameter is required unless the `query` parameter is provided.
    public let mdfilters: [MetadataFilter]?

    /// Defines the order in which search results are returned. This API
    /// defaults to returning items by relevance unless this parameter is
    /// explicitly specified.
    /// 
    /// * `relevance` (default) returns the results sorted by relevance to the
    /// query search term. The relevance is based on the occurrence of the search
    /// term in the items name, description, content, and additional properties.
    /// * `modified_at` returns the results ordered in descending order by date
    /// at which the item was last modified.
    public let sort: SearchForContentQueryParamsSortField?

    /// Defines the direction in which search results are ordered. This API
    /// defaults to returning items in descending (`DESC`) order unless this
    /// parameter is explicitly specified.
    /// 
    /// When results are sorted by `relevance` the ordering is locked to returning
    /// items in descending order of relevance, and this parameter is ignored.
    public let direction: SearchForContentQueryParamsDirectionField?

    /// Defines the maximum number of items to return as part of a page of
    /// results.
    public let limit: Int64?

    /// Defines whether the search results should include any items
    /// that the user recently accessed through a shared link.
    /// 
    /// When this parameter has been set to true,
    /// the format of the response of this API changes to return
    /// a list of [Search Results with
    /// Shared Links](r://search_results_with_shared_links).
    public let includeRecentSharedLinks: Bool?

    /// A comma-separated list of attributes to include in the
    /// response. This can be used to request fields that are
    /// not normally returned in a standard response.
    /// 
    /// Be aware that specifying this parameter will have the
    /// effect that none of the standard fields are returned in
    /// the response unless explicitly specified, instead only
    /// fields for the mini representation are returned, additional
    /// to the fields requested.
    public let fields: [String]?

    /// The offset of the item at which to begin the response.
    /// 
    /// Queries with offset parameter value
    /// exceeding 10000 will be rejected
    /// with a 400 response.
    public let offset: Int64?

    /// Limits the search results to items that were deleted by the given
    /// list of users, defined as a list of comma separated user IDs.
    /// 
    /// The `trash_content` parameter needs to be set to `trashed_only`.
    /// 
    /// If searching in trash is not performed, an empty result set
    /// is returned. The items need to be owned or shared with
    /// the currently authenticated user for them to show up in the search
    /// results.
    /// 
    /// If the user does not have access to any files owned by
    /// any of the users, an empty result set is returned.
    /// 
    /// Data available from 2023-02-01 onwards.
    public let deletedUserIds: [String]?

    /// Limits the search results to any items deleted within a given
    /// date range.
    /// 
    /// Date ranges are defined as comma separated RFC3339 timestamps.
    /// 
    /// If the the start date is omitted (`2014-05-17T13:35:01-07:00`),
    /// anything deleted before the end date will be returned.
    /// 
    /// If the end date is omitted (`2014-05-15T13:35:01-07:00`),
    /// the current date will be used as the end date instead.
    /// 
    /// The `trash_content` parameter needs to be set to `trashed_only`.
    /// 
    /// If searching in trash is not performed, then an empty result
    /// is returned.
    /// 
    /// Data available from 2023-02-01 onwards.
    public let deletedAtRange: [String]?

    /// Initializer for a SearchForContentQueryParams.
    ///
    /// - Parameters:
    ///   - query: The string to search for. This query is matched against item names,
    ///     descriptions, text content of files, and various other fields of
    ///     the different item types.
    ///     
    ///     This parameter supports a variety of operators to further refine
    ///     the results returns.
    ///     
    ///     * `""` - by wrapping a query in double quotes only exact matches are
    ///       returned by the API. Exact searches do not return search matches
    ///       based on specific character sequences. Instead, they return
    ///       matches based on phrases, that is, word sequences. For example:
    ///       A search for `"Blue-Box"` may return search results including
    ///       the sequence `"blue.box"`, `"Blue Box"`, and `"Blue-Box"`;
    ///       any item containing the words `Blue` and `Box` consecutively, in
    ///       the order specified.
    ///     * `AND` - returns items that contain both the search terms. For
    ///       example, a search for `marketing AND BoxWorks` returns items
    ///       that have both `marketing` and `BoxWorks` within its text in any order.
    ///       It does not return a result that only has `BoxWorks` in its text.
    ///     * `OR` - returns items that contain either of the search terms. For
    ///       example, a search for `marketing OR BoxWorks` returns a result that
    ///       has either `marketing` or `BoxWorks` within its text. Using this
    ///       operator is not necessary as we implicitly interpret multi-word
    ///       queries as `OR` unless another supported boolean term is used.
    ///     * `NOT` - returns items that do not contain the search term provided.
    ///       For example, a search for `marketing AND NOT BoxWorks` returns a result
    ///       that has only `marketing` within its text. Results containing
    ///       `BoxWorks` are omitted.
    ///     
    ///     We do not support lower case (that is,
    ///     `and`, `or`, and `not`) or mixed case (that is, `And`, `Or`, and `Not`)
    ///     operators.
    ///     
    ///     This field is required unless the `mdfilters` parameter is defined.
    ///   - scope: Limits the search results to either the files that the user has
    ///     access to, or to files available to the entire enterprise.
    ///     
    ///     The scope defaults to `user_content`, which limits the search
    ///     results to content that is available to the currently authenticated
    ///     user.
    ///     
    ///     The `enterprise_content` can be requested by an admin through our
    ///     support channels. Once this scope has been enabled for a user, it
    ///     will allow that use to query for content across the entire
    ///     enterprise and not only the content that they have access to.
    ///   - fileExtensions: Limits the search results to any files that match any of the provided
    ///     file extensions. This list is a comma-separated list of file extensions
    ///     without the dots.
    ///   - createdAtRange: Limits the search results to any items created within
    ///     a given date range.
    ///     
    ///     Date ranges are defined as comma separated RFC3339
    ///     timestamps.
    ///     
    ///     If the the start date is omitted (`,2014-05-17T13:35:01-07:00`)
    ///     anything created before the end date will be returned.
    ///     
    ///     If the end date is omitted (`2014-05-15T13:35:01-07:00,`) the
    ///     current date will be used as the end date instead.
    ///   - updatedAtRange: Limits the search results to any items updated within
    ///     a given date range.
    ///     
    ///     Date ranges are defined as comma separated RFC3339
    ///     timestamps.
    ///     
    ///     If the start date is omitted (`,2014-05-17T13:35:01-07:00`)
    ///     anything updated before the end date will be returned.
    ///     
    ///     If the end date is omitted (`2014-05-15T13:35:01-07:00,`) the
    ///     current date will be used as the end date instead.
    ///   - sizeRange: Limits the search results to any items with a size within
    ///     a given file size range. This applied to files and folders.
    ///     
    ///     Size ranges are defined as comma separated list of a lower
    ///     and upper byte size limit (inclusive).
    ///     
    ///     The upper and lower bound can be omitted to create open ranges.
    ///   - ownerUserIds: Limits the search results to any items that are owned
    ///     by the given list of owners, defined as a list of comma separated
    ///     user IDs.
    ///     
    ///     The items still need to be owned or shared with
    ///     the currently authenticated user for them to show up in the search
    ///     results. If the user does not have access to any files owned by any of
    ///     the users an empty result set will be returned.
    ///     
    ///     To search across an entire enterprise, we recommend using the
    ///     `enterprise_content` scope parameter which can be requested with our
    ///     support team.
    ///   - recentUpdaterUserIds: Limits the search results to any items that have been updated
    ///     by the given list of users, defined as a list of comma separated
    ///     user IDs.
    ///     
    ///     The items still need to be owned or shared with
    ///     the currently authenticated user for them to show up in the search
    ///     results. If the user does not have access to any files owned by any of
    ///     the users an empty result set will be returned.
    ///     
    ///     This feature only searches back to the last 10 versions of an item.
    ///   - ancestorFolderIds: Limits the search results to items within the given
    ///     list of folders, defined as a comma separated lists
    ///     of folder IDs.
    ///     
    ///     Search results will also include items within any subfolders
    ///     of those ancestor folders.
    ///     
    ///     The folders still need to be owned or shared with
    ///     the currently authenticated user. If the folder is not accessible by this
    ///     user, or it does not exist, a `HTTP 404` error code will be returned
    ///     instead.
    ///     
    ///     To search across an entire enterprise, we recommend using the
    ///     `enterprise_content` scope parameter which can be requested with our
    ///     support team.
    ///   - contentTypes: Limits the search results to any items that match the search query
    ///     for a specific part of the file, for example the file description.
    ///     
    ///     Content types are defined as a comma separated lists
    ///     of Box recognized content types. The allowed content types are as follows.
    ///     
    ///     * `name` - The name of the item, as defined by its `name` field.
    ///     * `description` - The description of the item, as defined by its
    ///       `description` field.
    ///     * `file_content` - The actual content of the file.
    ///     * `comments` - The content of any of the comments on a file or
    ///        folder.
    ///     * `tags` - Any tags that are applied to an item, as defined by its
    ///        `tags` field.
    ///   - type: Limits the search results to any items of this type. This
    ///     parameter only takes one value. By default the API returns
    ///     items that match any of these types.
    ///     
    ///     * `file` - Limits the search results to files,
    ///     * `folder` - Limits the search results to folders,
    ///     * `web_link` - Limits the search results to web links, also known
    ///        as bookmarks.
    ///   - trashContent: Determines if the search should look in the trash for items.
    ///     
    ///     By default, this API only returns search results for items
    ///     not currently in the trash (`non_trashed_only`).
    ///     
    ///     * `trashed_only` - Only searches for items currently in the trash
    ///     * `non_trashed_only` - Only searches for items currently not in
    ///       the trash
    ///     * `all_items` - Searches for both trashed and non-trashed items.
    ///   - mdfilters: Limits the search results to any items for which the metadata matches the provided filter.
    ///     This parameter is a list that specifies exactly **one** metadata template used to filter the search results. 
    ///     The parameter is required unless the `query` parameter is provided.
    ///   - sort: Defines the order in which search results are returned. This API
    ///     defaults to returning items by relevance unless this parameter is
    ///     explicitly specified.
    ///     
    ///     * `relevance` (default) returns the results sorted by relevance to the
    ///     query search term. The relevance is based on the occurrence of the search
    ///     term in the items name, description, content, and additional properties.
    ///     * `modified_at` returns the results ordered in descending order by date
    ///     at which the item was last modified.
    ///   - direction: Defines the direction in which search results are ordered. This API
    ///     defaults to returning items in descending (`DESC`) order unless this
    ///     parameter is explicitly specified.
    ///     
    ///     When results are sorted by `relevance` the ordering is locked to returning
    ///     items in descending order of relevance, and this parameter is ignored.
    ///   - limit: Defines the maximum number of items to return as part of a page of
    ///     results.
    ///   - includeRecentSharedLinks: Defines whether the search results should include any items
    ///     that the user recently accessed through a shared link.
    ///     
    ///     When this parameter has been set to true,
    ///     the format of the response of this API changes to return
    ///     a list of [Search Results with
    ///     Shared Links](r://search_results_with_shared_links).
    ///   - fields: A comma-separated list of attributes to include in the
    ///     response. This can be used to request fields that are
    ///     not normally returned in a standard response.
    ///     
    ///     Be aware that specifying this parameter will have the
    ///     effect that none of the standard fields are returned in
    ///     the response unless explicitly specified, instead only
    ///     fields for the mini representation are returned, additional
    ///     to the fields requested.
    ///   - offset: The offset of the item at which to begin the response.
    ///     
    ///     Queries with offset parameter value
    ///     exceeding 10000 will be rejected
    ///     with a 400 response.
    ///   - deletedUserIds: Limits the search results to items that were deleted by the given
    ///     list of users, defined as a list of comma separated user IDs.
    ///     
    ///     The `trash_content` parameter needs to be set to `trashed_only`.
    ///     
    ///     If searching in trash is not performed, an empty result set
    ///     is returned. The items need to be owned or shared with
    ///     the currently authenticated user for them to show up in the search
    ///     results.
    ///     
    ///     If the user does not have access to any files owned by
    ///     any of the users, an empty result set is returned.
    ///     
    ///     Data available from 2023-02-01 onwards.
    ///   - deletedAtRange: Limits the search results to any items deleted within a given
    ///     date range.
    ///     
    ///     Date ranges are defined as comma separated RFC3339 timestamps.
    ///     
    ///     If the the start date is omitted (`2014-05-17T13:35:01-07:00`),
    ///     anything deleted before the end date will be returned.
    ///     
    ///     If the end date is omitted (`2014-05-15T13:35:01-07:00`),
    ///     the current date will be used as the end date instead.
    ///     
    ///     The `trash_content` parameter needs to be set to `trashed_only`.
    ///     
    ///     If searching in trash is not performed, then an empty result
    ///     is returned.
    ///     
    ///     Data available from 2023-02-01 onwards.
    public init(query: String? = nil, scope: SearchForContentQueryParamsScopeField? = nil, fileExtensions: [String]? = nil, createdAtRange: [String]? = nil, updatedAtRange: [String]? = nil, sizeRange: [Int64]? = nil, ownerUserIds: [String]? = nil, recentUpdaterUserIds: [String]? = nil, ancestorFolderIds: [String]? = nil, contentTypes: [SearchForContentQueryParamsContentTypesField]? = nil, type: SearchForContentQueryParamsTypeField? = nil, trashContent: SearchForContentQueryParamsTrashContentField? = nil, mdfilters: [MetadataFilter]? = nil, sort: SearchForContentQueryParamsSortField? = nil, direction: SearchForContentQueryParamsDirectionField? = nil, limit: Int64? = nil, includeRecentSharedLinks: Bool? = nil, fields: [String]? = nil, offset: Int64? = nil, deletedUserIds: [String]? = nil, deletedAtRange: [String]? = nil) {
        self.query = query
        self.scope = scope
        self.fileExtensions = fileExtensions
        self.createdAtRange = createdAtRange
        self.updatedAtRange = updatedAtRange
        self.sizeRange = sizeRange
        self.ownerUserIds = ownerUserIds
        self.recentUpdaterUserIds = recentUpdaterUserIds
        self.ancestorFolderIds = ancestorFolderIds
        self.contentTypes = contentTypes
        self.type = type
        self.trashContent = trashContent
        self.mdfilters = mdfilters
        self.sort = sort
        self.direction = direction
        self.limit = limit
        self.includeRecentSharedLinks = includeRecentSharedLinks
        self.fields = fields
        self.offset = offset
        self.deletedUserIds = deletedUserIds
        self.deletedAtRange = deletedAtRange
    }

}
