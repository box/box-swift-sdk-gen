# TrashedWebLinksManager

<!-- box-swift-sdk-gen deprecation banner -->
> [!CAUTION]
> **`box-swift-sdk-gen` is deprecated and no longer maintained.** As of September 17, 2025, it receives no new features, bug fixes, or security patches. Do not use it for new projects.
>
> Use [`box-ios-sdk`](https://github.com/box/box-ios-sdk) v10+ instead: add `https://github.com/box/box-ios-sdk.git` with Swift Package Manager, or `pod 'BoxSDK', '>= 10.0.0'` with CocoaPods.
> The equivalent of this page is [box-ios-sdk/docs/TrashedWebLinks.md](https://github.com/box/box-ios-sdk/blob/main/docs/TrashedWebLinks.md). To migrate existing code, see the [migration guide](https://github.com/box/box-ios-sdk/blob/main/migration-guides/from-box-swift-sdk-gen-v0-to-box-ios-sdk.md).


- [Restore web link](#restore-web-link)
- [Get trashed web link](#get-trashed-web-link)
- [Permanently remove web link](#permanently-remove-web-link)

## Restore web link

Restores a web link that has been moved to the trash.

An optional new parent ID can be provided to restore the  web link to in case
the original folder has been deleted.

This operation is performed by calling function `restoreWeblinkFromTrash`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-web-links-id/).

<!-- sample post_web_links_id -->
```
try await client.trashedWebLinks.restoreWeblinkFromTrash(webLinkId: weblink.id)
```

### Arguments

- webLinkId `String`
  - The ID of the web link. Example: "12345"
- requestBody `RestoreWeblinkFromTrashRequestBody`
  - Request body of restoreWeblinkFromTrash method
- queryParams `RestoreWeblinkFromTrashQueryParams`
  - Query parameters of restoreWeblinkFromTrash method
- headers `RestoreWeblinkFromTrashHeaders`
  - Headers of restoreWeblinkFromTrash method


### Returns

This function returns a value of type `TrashWebLinkRestored`.

Returns a web link object when it has been restored.


## Get trashed web link

Retrieves a web link that has been moved to the trash.

This operation is performed by calling function `getTrashedWebLinkById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-web-links-id-trash/).

<!-- sample get_web_links_id_trash -->
```
try await client.trashedWebLinks.getTrashedWebLinkById(webLinkId: weblink.id)
```

### Arguments

- webLinkId `String`
  - The ID of the web link. Example: "12345"
- queryParams `GetTrashedWebLinkByIdQueryParams`
  - Query parameters of getTrashedWebLinkById method
- headers `GetTrashedWebLinkByIdHeaders`
  - Headers of getTrashedWebLinkById method


### Returns

This function returns a value of type `TrashWebLink`.

Returns the web link that was trashed,
including information about when the it
was moved to the trash.


## Permanently remove web link

Permanently deletes a web link that is in the trash.
This action cannot be undone.

This operation is performed by calling function `deleteTrashedWebLinkById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/delete-web-links-id-trash/).

<!-- sample delete_web_links_id_trash -->
```
try await client.trashedWebLinks.deleteTrashedWebLinkById(webLinkId: weblink.id)
```

### Arguments

- webLinkId `String`
  - The ID of the web link. Example: "12345"
- headers `DeleteTrashedWebLinkByIdHeaders`
  - Headers of deleteTrashedWebLinkById method


### Returns

This function returns a value of type ``.

Returns an empty response when the web link was
permanently deleted.


