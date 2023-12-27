# ChunkedUploadsManager

This is a manager for chunked uploads (allowed for files at least 20MB).

- [Create upload session](#create-upload-session)
- [Create upload session for existing file](#create-upload-session-for-existing-file)
- [Get upload session](#get-upload-session)
- [Upload part of file](#upload-part-of-file)
- [Remove upload session](#remove-upload-session)
- [List parts](#list-parts)
- [Commit upload session](#commit-upload-session)

## Create upload session

Creates an upload session for a new file.

This operation is performed by calling function `createFileUploadSession`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-files-upload-sessions/).

*Currently we don't have an example for calling `createFileUploadSession` in integration tests*

### Arguments

- requestBody `CreateFileUploadSessionRequestBody`
  - Request body of createFileUploadSession method
- headers `CreateFileUploadSessionHeaders`
  - Headers of createFileUploadSession method


### Returns

This function returns a value of type `UploadSession`.

Returns a new upload session.


## Create upload session for existing file

Creates an upload session for an existing file.

This operation is performed by calling function `createFileUploadSessionForExistingFile`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-files-id-upload-sessions/).

*Currently we don't have an example for calling `createFileUploadSessionForExistingFile` in integration tests*

### Arguments

- fileId `String`
  - The unique identifier that represents a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`. Example: "12345"
- requestBody `CreateFileUploadSessionForExistingFileRequestBody`
  - Request body of createFileUploadSessionForExistingFile method
- headers `CreateFileUploadSessionForExistingFileHeaders`
  - Headers of createFileUploadSessionForExistingFile method


### Returns

This function returns a value of type `UploadSession`.

Returns a new upload session.


## Get upload session

Return information about an upload session.

This operation is performed by calling function `getFileUploadSessionById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-files-upload-sessions-id/).

*Currently we don't have an example for calling `getFileUploadSessionById` in integration tests*

### Arguments

- uploadSessionId `String`
  - The ID of the upload session. Example: "D5E3F7A"
- headers `GetFileUploadSessionByIdHeaders`
  - Headers of getFileUploadSessionById method


### Returns

This function returns a value of type `UploadSession`.

Returns an upload session object.


## Upload part of file

Updates a chunk of an upload session for a file.

This operation is performed by calling function `uploadFilePart`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/put-files-upload-sessions-id/).

*Currently we don't have an example for calling `uploadFilePart` in integration tests*

### Arguments

- uploadSessionId `String`
  - The ID of the upload session. Example: "D5E3F7A"
- requestBody `InputStream`
  - Request body of uploadFilePart method
- headers `UploadFilePartHeaders`
  - Headers of uploadFilePart method


### Returns

This function returns a value of type `UploadedPart`.

Chunk has been uploaded successfully.


## Remove upload session

Abort an upload session and discard all data uploaded.

This cannot be reversed.

This operation is performed by calling function `deleteFileUploadSessionById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/delete-files-upload-sessions-id/).

*Currently we don't have an example for calling `deleteFileUploadSessionById` in integration tests*

### Arguments

- uploadSessionId `String`
  - The ID of the upload session. Example: "D5E3F7A"
- headers `DeleteFileUploadSessionByIdHeaders`
  - Headers of deleteFileUploadSessionById method


### Returns

This function returns a value of type ``.

A blank response is returned if the session was
successfully aborted.


## List parts

Return a list of the chunks uploaded to the upload
session so far.

This operation is performed by calling function `getFileUploadSessionParts`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-files-upload-sessions-id-parts/).

*Currently we don't have an example for calling `getFileUploadSessionParts` in integration tests*

### Arguments

- uploadSessionId `String`
  - The ID of the upload session. Example: "D5E3F7A"
- queryParams `GetFileUploadSessionPartsQueryParams`
  - Query parameters of getFileUploadSessionParts method
- headers `GetFileUploadSessionPartsHeaders`
  - Headers of getFileUploadSessionParts method


### Returns

This function returns a value of type `UploadParts`.

Returns a list of parts that have been uploaded.


## Commit upload session

Close an upload session and create a file from the
uploaded chunks.

This operation is performed by calling function `createFileUploadSessionCommit`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-files-upload-sessions-id-commit/).

*Currently we don't have an example for calling `createFileUploadSessionCommit` in integration tests*

### Arguments

- uploadSessionId `String`
  - The ID of the upload session. Example: "D5E3F7A"
- requestBody `CreateFileUploadSessionCommitRequestBody`
  - Request body of createFileUploadSessionCommit method
- headers `CreateFileUploadSessionCommitHeaders`
  - Headers of createFileUploadSessionCommit method


### Returns

This function returns a value of type `Files`.

Returns the file object in a list.Returns when all chunks have been uploaded but not yet processed.

Inspect the upload session to get more information about the
progress of processing the chunks, then retry committing the file
when all chunks have processed.


