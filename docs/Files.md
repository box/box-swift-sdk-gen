# FilesManager


- [Get file information](#get-file-information)
- [Update file](#update-file)
- [Delete file](#delete-file)
- [Copy file](#copy-file)
- [Get file thumbnail URL](#get-file-thumbnail-url)
- [Get file thumbnail](#get-file-thumbnail)

## Get file information

Retrieves the details about a file.

This operation is performed by calling function `getFileById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-files-id/).

<!-- sample get_files_id -->
```
try await client.files.getFileById(fileId: uploadedFile.id, queryParams: GetFileByIdQueryParams(fields: ["is_externally_owned", "has_collaborations"]))
```

### Arguments

- fileId `String`
  - The unique identifier that represents a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`. Example: "12345"
- queryParams `GetFileByIdQueryParams`
  - Query parameters of getFileById method
- headers `GetFileByIdHeaders`
  - Headers of getFileById method


### Returns

This function returns a value of type `FileFull`.

Returns a file object.

Not all available fields are returned by default. Use the
[fields](#param-fields) query parameter to explicitly request
any specific fields.


## Update file

Updates a file. This can be used to rename or move a file,
create a shared link, or lock a file.

This operation is performed by calling function `updateFileById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/put-files-id/).

<!-- sample put_files_id -->
```
try await client.files.updateFileById(fileId: fileToUpdate.id, requestBody: UpdateFileByIdRequestBody(name: updatedName, description: "Updated description"))
```

### Arguments

- fileId `String`
  - The unique identifier that represents a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`. Example: "12345"
- requestBody `UpdateFileByIdRequestBody`
  - Request body of updateFileById method
- queryParams `UpdateFileByIdQueryParams`
  - Query parameters of updateFileById method
- headers `UpdateFileByIdHeaders`
  - Headers of updateFileById method


### Returns

This function returns a value of type `FileFull`.

Returns a file object.

Not all available fields are returned by default. Use the
[fields](#param-fields) query parameter to explicitly request
any specific fields.


## Delete file

Deletes a file, either permanently or by moving it to
the trash.

The the enterprise settings determine whether the item will
be permanently deleted from Box or moved to the trash.

This operation is performed by calling function `deleteFileById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/delete-files-id/).

<!-- sample delete_files_id -->
```
try await client.files.deleteFileById(fileId: thumbnailFile.id)
```

### Arguments

- fileId `String`
  - The unique identifier that represents a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`. Example: "12345"
- headers `DeleteFileByIdHeaders`
  - Headers of deleteFileById method


### Returns

This function returns a value of type ``.

Returns an empty response when the file has been successfully
deleted.


## Copy file

Creates a copy of a file.

This operation is performed by calling function `copyFile`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-files-id-copy/).

<!-- sample post_files_id_copy -->
```
try await client.files.copyFile(fileId: fileOrigin.id, requestBody: CopyFileRequestBody(parent: CopyFileRequestBodyParentField(id: "0"), name: copiedFileName))
```

### Arguments

- fileId `String`
  - The unique identifier that represents a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`. Example: "12345"
- requestBody `CopyFileRequestBody`
  - Request body of copyFile method
- queryParams `CopyFileQueryParams`
  - Query parameters of copyFile method
- headers `CopyFileHeaders`
  - Headers of copyFile method


### Returns

This function returns a value of type `FileFull`.

Returns a new file object representing the copied file.

Not all available fields are returned by default. Use the
[fields](#param-fields) query parameter to explicitly request
any specific fields.


## Get file thumbnail URL

Get the download URL without downloading the content.

This operation is performed by calling function `getFileThumbnailUrl`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-files-id-thumbnail-id/).

<!-- sample get_files_id_thumbnail_id -->
```
try await client.files.getFileThumbnailUrl(fileId: thumbnailFile.id, extension_: GetFileThumbnailUrlExtension.png)
```

### Arguments

- fileId `String`
  - The unique identifier that represents a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`. Example: "12345"
- extension_ `GetFileThumbnailUrlExtension`
  - The file format for the thumbnail. Example: "png"
- queryParams `GetFileThumbnailUrlQueryParams`
  - Query parameters of getFileThumbnailById method
- headers `GetFileThumbnailUrlHeaders`
  - Headers of getFileThumbnailById method


### Returns

This function returns a value of type `String`.

When a thumbnail can be created the thumbnail data will be
returned in the body of the response.Sometimes generating a thumbnail can take a few seconds. In these
situations the API returns a `Location`-header pointing to a
placeholder graphic for this file type.

The placeholder graphic can be used in a user interface until the
thumbnail generation has completed. The `Retry-After`-header indicates
when to the thumbnail will be ready. At that time, retry this endpoint
to retrieve the thumbnail.


## Get file thumbnail

Retrieves a thumbnail, or smaller image representation, of a file.

Sizes of `32x32`,`64x64`, `128x128`, and `256x256` can be returned in
the `.png` format and sizes of `32x32`, `160x160`, and `320x320`
can be returned in the `.jpg` format.

Thumbnails can be generated for the image and video file formats listed
[found on our community site][1].

[1]: https://community.box.com/t5/Migrating-and-Previewing-Content/File-Types-and-Fonts-Supported-in-Box-Content-Preview/ta-p/327

This operation is performed by calling function `getFileThumbnailById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-files-id-thumbnail-id/).

<!-- sample get_files_id_thumbnail_id -->
```
try await client.files.getFileThumbnailById(fileId: thumbnailFile.id, extension_: GetFileThumbnailByIdExtension.png, downloadDestinationUrl: destinationPath)
```

### Arguments

- fileId `String`
  - The unique identifier that represents a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`. Example: "12345"
- extension_ `GetFileThumbnailByIdExtension`
  - The file format for the thumbnail. Example: "png"
- downloadDestinationUrl `URL`
  - The URL on disk where the file will be saved once it has been downloaded.
- queryParams `GetFileThumbnailByIdQueryParams`
  - Query parameters of getFileThumbnailById method
- headers `GetFileThumbnailByIdHeaders`
  - Headers of getFileThumbnailById method


### Returns

This function returns a value of type `URL?`.

When a thumbnail can be created the thumbnail data will be
returned in the body of the response.Sometimes generating a thumbnail can take a few seconds. In these
situations the API returns a `Location`-header pointing to a
placeholder graphic for this file type.

The placeholder graphic can be used in a user interface until the
thumbnail generation has completed. The `Retry-After`-header indicates
when to the thumbnail will be ready. At that time, retry this endpoint
to retrieve the thumbnail.


