# FileWatermarksManager

<!-- box-swift-sdk-gen deprecation banner -->
> [!CAUTION]
> **`box-swift-sdk-gen` is deprecated and no longer maintained.** As of September 17, 2025, it receives no new features, bug fixes, or security patches. Do not use it for new projects.
>
> Use [`box-ios-sdk`](https://github.com/box/box-ios-sdk) v10+ instead: add `https://github.com/box/box-ios-sdk.git` with Swift Package Manager, or `pod 'BoxSDK', '>= 10.0.0'` with CocoaPods.
> The equivalent of this page is [box-ios-sdk/docs/FileWatermarks.md](https://github.com/box/box-ios-sdk/blob/main/docs/FileWatermarks.md). To migrate existing code, see the [migration guide](https://github.com/box/box-ios-sdk/blob/main/migration-guides/from-box-swift-sdk-gen-v0-to-box-ios-sdk.md).


- [Get watermark on file](#get-watermark-on-file)
- [Apply watermark to file](#apply-watermark-to-file)
- [Remove watermark from file](#remove-watermark-from-file)

## Get watermark on file

Retrieve the watermark for a file.

This operation is performed by calling function `getFileWatermark`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-files-id-watermark/).

<!-- sample get_files_id_watermark -->
```
try await client.fileWatermarks.getFileWatermark(fileId: file.id)
```

### Arguments

- fileId `String`
  - The unique identifier that represents a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`. Example: "12345"
- headers `GetFileWatermarkHeaders`
  - Headers of getFileWatermark method


### Returns

This function returns a value of type `Watermark`.

Returns an object containing information about the
watermark associated for to this file.


## Apply watermark to file

Applies or update a watermark on a file.

This operation is performed by calling function `updateFileWatermark`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/put-files-id-watermark/).

<!-- sample put_files_id_watermark -->
```
try await client.fileWatermarks.updateFileWatermark(fileId: file.id, requestBody: UpdateFileWatermarkRequestBody(watermark: UpdateFileWatermarkRequestBodyWatermarkField(imprint: UpdateFileWatermarkRequestBodyWatermarkImprintField.default_)))
```

### Arguments

- fileId `String`
  - The unique identifier that represents a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`. Example: "12345"
- requestBody `UpdateFileWatermarkRequestBody`
  - Request body of updateFileWatermark method
- headers `UpdateFileWatermarkHeaders`
  - Headers of updateFileWatermark method


### Returns

This function returns a value of type `Watermark`.

Returns an updated watermark if a watermark already
existed on this file.Returns a new watermark if no watermark existed on
this file yet.


## Remove watermark from file

Removes the watermark from a file.

This operation is performed by calling function `deleteFileWatermark`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/delete-files-id-watermark/).

<!-- sample delete_files_id_watermark -->
```
try await client.fileWatermarks.deleteFileWatermark(fileId: file.id)
```

### Arguments

- fileId `String`
  - The unique identifier that represents a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`. Example: "12345"
- headers `DeleteFileWatermarkHeaders`
  - Headers of deleteFileWatermark method


### Returns

This function returns a value of type ``.

Removes the watermark and returns an empty response.


