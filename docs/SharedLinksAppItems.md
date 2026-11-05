# SharedLinksAppItemsManager

<!-- box-swift-sdk-gen deprecation banner -->
> [!CAUTION]
> **`box-swift-sdk-gen` is deprecated and no longer maintained.** As of September 17, 2025, it receives no new features, bug fixes, or security patches. Do not use it for new projects.
>
> Use [`box-ios-sdk`](https://github.com/box/box-ios-sdk) v10+ instead: add `https://github.com/box/box-ios-sdk.git` with Swift Package Manager, or `pod 'BoxSDK', '>= 10.0.0'` with CocoaPods.
> The equivalent of this page is [box-ios-sdk/docs/SharedLinksAppItems.md](https://github.com/box/box-ios-sdk/blob/main/docs/SharedLinksAppItems.md). To migrate existing code, see the [migration guide](https://github.com/box/box-ios-sdk/blob/main/migration-guides/from-box-swift-sdk-gen-v0-to-box-ios-sdk.md).


- [Find app item for shared link](#find-app-item-for-shared-link)

## Find app item for shared link

Returns the app item represented by a shared link.

The link can originate from the current enterprise or another.

This operation is performed by calling function `findAppItemForSharedLink`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-shared-items--app-items/).

<!-- sample get_shared_items#app_items -->
```
try await client.sharedLinksAppItems.findAppItemForSharedLink(headers: FindAppItemForSharedLinkHeaders(boxapi: "\("shared_link=")\(appItemSharedLink)"))
```

### Arguments

- headers `FindAppItemForSharedLinkHeaders`
  - Headers of findAppItemForSharedLink method


### Returns

This function returns a value of type `AppItem`.

Returns a full app item resource if the shared link is valid and
the user has access to it.


