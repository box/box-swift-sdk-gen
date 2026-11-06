# TrashedFilesManager

<!-- box-swift-sdk-gen deprecation banner -->
> [!CAUTION]
> **`box-swift-sdk-gen` is deprecated and no longer maintained.** As of September 17, 2025, it receives no new features, bug fixes, or security patches. Do not use it for new projects.
>
> Use [`box-ios-sdk`](https://github.com/box/box-ios-sdk) v10+ instead: add `https://github.com/box/box-ios-sdk.git` with Swift Package Manager, or `pod 'BoxSDK', '>= 10.0.0'` with CocoaPods.
> The equivalent of this page is [box-ios-sdk/docs/TrashedFiles.md](https://github.com/box/box-ios-sdk/blob/main/docs/TrashedFiles.md). To migrate existing code, see the [migration guide](https://github.com/box/box-ios-sdk/blob/main/migration-guides/from-box-swift-sdk-gen-v0-to-box-ios-sdk.md).


- [Restore file](#restore-file)
- [Get trashed file](#get-trashed-file)
- [Permanently remove file](#permanently-remove-file)

## Restore file

Restores a file that has been moved to the trash.

An optional new parent ID can be provided to restore the file to in case the
original folder has been deleted.

This operation is performed by calling function `restoreFileFromTrash`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-files-id/).

<!-- sample post_files_id -->
```
try await client.trashedFiles.restoreFileFromTrash(fileId: file.id)
```

### Arguments

- fileId `String`
  - The unique identifier that represents a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`. Example: "12345"
- requestBody `RestoreFileFromTrashRequestBody`
  - Request body of restoreFileFromTrash method
- queryParams `RestoreFileFromTrashQueryParams`
  - Query parameters of restoreFileFromTrash method
- headers `RestoreFileFromTrashHeaders`
  - Headers of restoreFileFromTrash method


### Returns

This function returns a value of type `TrashFileRestored`.

Returns a file object when the file has been restored.


## Get trashed file

Retrieves a file that has been moved to the trash.

Please note that only if the file itself has been moved to the
trash can it be retrieved with this API call. If instead one of
its parent folders was moved to the trash, only that folder
can be inspected using the
[`GET /folders/:id/trash`](e://get_folders_id_trash) API.

To list all items that have been moved to the trash, please
use the [`GET /folders/trash/items`](e://get-folders-trash-items/)
API.

This operation is performed by calling function `getTrashedFileById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-files-id-trash/).

<!-- sample get_files_id_trash -->
```
try await client.trashedFiles.getTrashedFileById(fileId: file.id)
```

### Arguments

- fileId `String`
  - The unique identifier that represents a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`. Example: "12345"
- queryParams `GetTrashedFileByIdQueryParams`
  - Query parameters of getTrashedFileById method
- headers `GetTrashedFileByIdHeaders`
  - Headers of getTrashedFileById method


### Returns

This function returns a value of type `TrashFile`.

Returns the file that was trashed,
including information about when the it
was moved to the trash.


## Permanently remove file

Permanently deletes a file that is in the trash.
This action cannot be undone.

This operation is performed by calling function `deleteTrashedFileById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/delete-files-id-trash/).

<!-- sample delete_files_id_trash -->
```
try await client.trashedFiles.deleteTrashedFileById(fileId: file.id)
```

### Arguments

- fileId `String`
  - The unique identifier that represents a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`. Example: "12345"
- headers `DeleteTrashedFileByIdHeaders`
  - Headers of deleteTrashedFileById method


### Returns

This function returns a value of type ``.

Returns an empty response when the file was
permanently deleted.


