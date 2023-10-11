import Foundation

public class TransferManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Move all of the items (files, folders and workflows) owned by a user into
    /// another user's account
    /// 
    /// Only the root folder (`0`) can be transferred.
    /// 
    /// Folders can only be moved across users by users with administrative
    /// permissions.
    /// 
    /// All existing shared links and folder-level collaborations are transferred
    /// during the operation. Please note that while collaborations at the individual
    /// file-level are transferred during the operation, the collaborations are
    /// deleted when the original user is deleted.
    /// 
    /// This call will be performed synchronously which might lead to a slow response
    /// when the source user has a large number of items in all of its folders.
    /// 
    /// If the destination path has a metadata cascade policy attached to any of
    /// the parent folders, a metadata cascade operation will be kicked off
    /// asynchronously.
    /// 
    /// There is currently no way to check for when this operation is finished.
    /// 
    /// The destination folder's name will be in the format `{User}'s Files and
    /// Folders`, where `{User}` is the display name of the user.
    /// 
    /// To make this API call your application will need to have the "Read and write
    /// all files and folders stored in Box" scope enabled.
    /// 
    /// Please make sure the destination user has access to `Relay` or `Relay Lite`,
    /// and has access to the files and folders involved in the workflows being
    /// transferred.
    /// 
    /// Admins will receive an email when the operation is completed.
    ///
    /// - Parameters:
    ///   - userId: The ID of the user.
    ///     Example: "12345"
    ///   - requestBody: Request body of transferOwnedFolder method
    ///   - queryParams: Query parameters of transferOwnedFolder method
    ///   - headers: Headers of transferOwnedFolder method
    /// - Returns: The `FolderFull`.
    /// - Throws: The `GeneralError`.
    public func transferOwnedFolder(userId: String, requestBody: TransferOwnedFolderRequestBodyArg, queryParams: TransferOwnedFolderQueryParamsArg = TransferOwnedFolderQueryParamsArg(), headers: TransferOwnedFolderHeadersArg = TransferOwnedFolderHeadersArg()) async throws -> FolderFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields), "notify": Utils.Strings.toString(value: queryParams.notify)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/users/")\(userId)\("/folders/0")", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FolderFull.deserialize(from: response.text)
    }

}
