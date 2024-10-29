# UploadsManager


- [Upload file version](#upload-file-version)
- [Preflight check before upload](#preflight-check-before-upload)
- [Upload file](#upload-file)

## Upload file version

Update a file's content. For file sizes over 50MB we recommend
using the Chunk Upload APIs.

The `attributes` part of the body must come **before** the
`file` part. Requests that do not follow this format when
uploading the file will receive a HTTP `400` error with a
`metadata_after_file_contents` error code.

This operation is performed by calling function `uploadFileVersion`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-files-id-content/).

<!-- sample post_files_id_content -->
```
try await client.uploads.uploadFileVersion(fileId: file.id, requestBody: UploadFileVersionRequestBody(attributes: UploadFileVersionRequestBodyAttributesField(name: file.name!), file: Utils.generateByteStream(size: 20)))
```

### Arguments

- fileId `String`
  - The unique identifier that represents a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`. Example: "12345"
- requestBody `UploadFileVersionRequestBody`
  - Request body of uploadFileVersion method
- queryParams `UploadFileVersionQueryParams`
  - Query parameters of uploadFileVersion method
- headers `UploadFileVersionHeaders`
  - Headers of uploadFileVersion method


### Returns

This function returns a value of type `Files`.

Returns the new file object in a list.


## Preflight check before upload

Performs a check to verify that a file will be accepted by Box
before you upload the entire file.

This operation is performed by calling function `preflightFileUploadCheck`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/options-files-content/).

*Currently we don't have an example for calling `preflightFileUploadCheck` in integration tests*

### Arguments

- requestBody `PreflightFileUploadCheckRequestBody`
  - Request body of preflightFileUploadCheck method
- headers `PreflightFileUploadCheckHeaders`
  - Headers of preflightFileUploadCheck method


### Returns

This function returns a value of type `UploadUrl`.

If the check passed, the response will include a session URL that
can be used to upload the file to.


## Upload file

Uploads a small file to Box. For file sizes over 50MB we recommend
using the Chunk Upload APIs.

The `attributes` part of the body must come **before** the
`file` part. Requests that do not follow this format when
uploading the file will receive a HTTP `400` error with a
`metadata_after_file_contents` error code.

This operation is performed by calling function `uploadFile`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-files-content/).

<!-- sample post_files_content -->
```
try await parentClient.uploads.uploadFile(requestBody: UploadFileRequestBody(attributes: UploadFileRequestBodyAttributesField(name: Utils.getUUID(), parent: UploadFileRequestBodyAttributesParentField(id: "0")), file: Utils.generateByteStream(size: 1024 * 1024)))
```

### Arguments

- requestBody `UploadFileRequestBody`
  - Request body of uploadFile method
- queryParams `UploadFileQueryParams`
  - Query parameters of uploadFile method
- headers `UploadFileHeaders`
  - Headers of uploadFile method


### Returns

This function returns a value of type `Files`.

Returns the new file object in a list.


