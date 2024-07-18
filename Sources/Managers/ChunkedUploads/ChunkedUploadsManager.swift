import Foundation

public class ChunkedUploadsManager {
    public let auth: Authentication?

    public let networkSession: NetworkSession

    public init(auth: Authentication? = nil, networkSession: NetworkSession = NetworkSession()) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Creates an upload session for a new file.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createFileUploadSession method
    ///   - headers: Headers of createFileUploadSession method
    /// - Returns: The `UploadSession`.
    /// - Throws: The `GeneralError`.
    public func createFileUploadSession(requestBody: CreateFileUploadSessionRequestBody, headers: CreateFileUploadSessionHeaders = CreateFileUploadSessionHeaders()) async throws -> UploadSession {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.uploadUrl)\("/2.0/files/upload_sessions")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try UploadSession.deserialize(from: response.data)
    }

    /// Creates an upload session for an existing file.
    ///
    /// - Parameters:
    ///   - fileId: The unique identifier that represents a file.
    ///     
    ///     The ID for any file can be determined
    ///     by visiting a file in the web application
    ///     and copying the ID from the URL. For example,
    ///     for the URL `https://*.app.box.com/files/123`
    ///     the `file_id` is `123`.
    ///     Example: "12345"
    ///   - requestBody: Request body of createFileUploadSessionForExistingFile method
    ///   - headers: Headers of createFileUploadSessionForExistingFile method
    /// - Returns: The `UploadSession`.
    /// - Throws: The `GeneralError`.
    public func createFileUploadSessionForExistingFile(fileId: String, requestBody: CreateFileUploadSessionForExistingFileRequestBody, headers: CreateFileUploadSessionForExistingFileHeaders = CreateFileUploadSessionForExistingFileHeaders()) async throws -> UploadSession {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.uploadUrl)\("/2.0/files/")\(fileId)\("/upload_sessions")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try UploadSession.deserialize(from: response.data)
    }

    /// Return information about an upload session.
    ///
    /// - Parameters:
    ///   - uploadSessionId: The ID of the upload session.
    ///     Example: "D5E3F7A"
    ///   - headers: Headers of getFileUploadSessionById method
    /// - Returns: The `UploadSession`.
    /// - Throws: The `GeneralError`.
    public func getFileUploadSessionById(uploadSessionId: String, headers: GetFileUploadSessionByIdHeaders = GetFileUploadSessionByIdHeaders()) async throws -> UploadSession {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.uploadUrl)\("/2.0/files/upload_sessions/")\(uploadSessionId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try UploadSession.deserialize(from: response.data)
    }

    /// Updates a chunk of an upload session for a file.
    ///
    /// - Parameters:
    ///   - uploadSessionId: The ID of the upload session.
    ///     Example: "D5E3F7A"
    ///   - requestBody: Request body of uploadFilePart method
    ///   - headers: Headers of uploadFilePart method
    /// - Returns: The `UploadedPart`.
    /// - Throws: The `GeneralError`.
    public func uploadFilePart(uploadSessionId: String, requestBody: InputStream, headers: UploadFilePartHeaders) async throws -> UploadedPart {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["digest": Utils.Strings.toString(value: headers.digest), "content-range": Utils.Strings.toString(value: headers.contentRange)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.uploadUrl)\("/2.0/files/upload_sessions/")\(uploadSessionId)", options: FetchOptions(method: "PUT", headers: headersMap, fileStream: requestBody, contentType: "application/octet-stream", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try UploadedPart.deserialize(from: response.data)
    }

    /// Abort an upload session and discard all data uploaded.
    /// 
    /// This cannot be reversed.
    ///
    /// - Parameters:
    ///   - uploadSessionId: The ID of the upload session.
    ///     Example: "D5E3F7A"
    ///   - headers: Headers of deleteFileUploadSessionById method
    /// - Throws: The `GeneralError`.
    public func deleteFileUploadSessionById(uploadSessionId: String, headers: DeleteFileUploadSessionByIdHeaders = DeleteFileUploadSessionByIdHeaders()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.uploadUrl)\("/2.0/files/upload_sessions/")\(uploadSessionId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    /// Return a list of the chunks uploaded to the upload
    /// session so far.
    ///
    /// - Parameters:
    ///   - uploadSessionId: The ID of the upload session.
    ///     Example: "D5E3F7A"
    ///   - queryParams: Query parameters of getFileUploadSessionParts method
    ///   - headers: Headers of getFileUploadSessionParts method
    /// - Returns: The `UploadParts`.
    /// - Throws: The `GeneralError`.
    public func getFileUploadSessionParts(uploadSessionId: String, queryParams: GetFileUploadSessionPartsQueryParams = GetFileUploadSessionPartsQueryParams(), headers: GetFileUploadSessionPartsHeaders = GetFileUploadSessionPartsHeaders()) async throws -> UploadParts {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["offset": Utils.Strings.toString(value: queryParams.offset), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.uploadUrl)\("/2.0/files/upload_sessions/")\(uploadSessionId)\("/parts")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try UploadParts.deserialize(from: response.data)
    }

    /// Close an upload session and create a file from the
    /// uploaded chunks.
    ///
    /// - Parameters:
    ///   - uploadSessionId: The ID of the upload session.
    ///     Example: "D5E3F7A"
    ///   - requestBody: Request body of createFileUploadSessionCommit method
    ///   - headers: Headers of createFileUploadSessionCommit method
    /// - Returns: The `Files`.
    /// - Throws: The `GeneralError`.
    public func createFileUploadSessionCommit(uploadSessionId: String, requestBody: CreateFileUploadSessionCommitRequestBody, headers: CreateFileUploadSessionCommitHeaders) async throws -> Files {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["digest": Utils.Strings.toString(value: headers.digest), "if-match": Utils.Strings.toString(value: headers.ifMatch), "if-none-match": Utils.Strings.toString(value: headers.ifNoneMatch)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.uploadUrl)\("/2.0/files/upload_sessions/")\(uploadSessionId)\("/commit")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Files.deserialize(from: response.data)
    }

    public func reducer(acc: PartAccumulator, chunk: InputStream) async throws -> PartAccumulator {
        let lastIndex: Int = acc.lastIndex
        let parts: [UploadPart] = acc.parts
        let chunkBuffer: Data = Utils.readByteStream(byteStream: chunk)
        let hash: Hash = Hash(algorithm: HashName.sha1)
        hash.updateHash(data: chunkBuffer)
        let sha1: String = await hash.digestHash(encoding: "base64")
        let digest: String = "\("sha=")\(sha1)"
        let chunkSize: Int = Utils.bufferLength(buffer: chunkBuffer)
        let bytesStart: Int = lastIndex + 1
        let bytesEnd: Int = lastIndex + chunkSize
        let contentRange: String = "\("bytes ")\(Utils.Strings.toString(value: bytesStart)!)\("-")\(Utils.Strings.toString(value: bytesEnd)!)\("/")\(Utils.Strings.toString(value: acc.fileSize)!)"
        let uploadedPart: UploadedPart = try await self.uploadFilePart(uploadSessionId: acc.uploadSessionId, requestBody: Utils.generateByteStreamFromBuffer(buffer: chunkBuffer), headers: UploadFilePartHeaders(digest: digest, contentRange: contentRange))
        let part: UploadPart = uploadedPart.part!
        let partSha1: String = Utils.Strings.hextToBase64(value: part.sha1!)
        assert(partSha1 == sha1)
        assert(part.size! == chunkSize)
        assert(part.offset! == bytesStart)
        acc.fileHash.updateHash(data: chunkBuffer)
        return PartAccumulator(lastIndex: bytesEnd, parts: parts + [part], fileSize: acc.fileSize, uploadSessionId: acc.uploadSessionId, fileHash: acc.fileHash)
    }

    /// Starts the process of chunk uploading a big file. Should return a File object representing uploaded file.
    ///
    /// - Parameters:
    ///   - file: The stream of the file to upload.
    ///   - fileName: The name of the file, which will be used for storage in Box.
    ///   - fileSize: The total size of the file for the chunked upload in bytes.
    ///   - parentFolderId: The ID of the folder where the file should be uploaded.
    /// - Returns: The `FileFull`.
    /// - Throws: The `GeneralError`.
    public func uploadBigFile(file: InputStream, fileName: String, fileSize: Int64, parentFolderId: String) async throws -> FileFull {
        let uploadSession: UploadSession = try await self.createFileUploadSession(requestBody: CreateFileUploadSessionRequestBody(folderId: parentFolderId, fileSize: fileSize, fileName: fileName))
        let uploadSessionId: String = uploadSession.id!
        let partSize: Int64 = uploadSession.partSize!
        let totalParts: Int = uploadSession.totalParts!
        assert(partSize * Int64(totalParts) >= fileSize)
        assert(uploadSession.numPartsProcessed == 0)
        let fileHash: Hash = Hash(algorithm: HashName.sha1)
        let chunksIterator: AsyncStream<InputStream> = Utils.iterateChunks(stream: file, chunkSize: partSize, fileSize: fileSize)
        let results: PartAccumulator = try await Utils.reduceIterator(iterator: chunksIterator, reducer: self.reducer, initialValue: PartAccumulator(lastIndex: -1, parts: [], fileSize: fileSize, uploadSessionId: uploadSessionId, fileHash: fileHash))
        let parts: [UploadPart] = results.parts
        let processedSessionParts: UploadParts = try await self.getFileUploadSessionParts(uploadSessionId: uploadSessionId)
        assert(processedSessionParts.totalCount! == totalParts)
        let sha1: String = await fileHash.digestHash(encoding: "base64")
        let digest: String = "\("sha=")\(sha1)"
        let committedSession: Files = try await self.createFileUploadSessionCommit(uploadSessionId: uploadSessionId, requestBody: CreateFileUploadSessionCommitRequestBody(parts: parts), headers: CreateFileUploadSessionCommitHeaders(digest: digest))
        return committedSession.entries![0]
    }

}
