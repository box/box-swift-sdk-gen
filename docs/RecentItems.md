# RecentItemsManager

<!-- box-swift-sdk-gen deprecation banner -->
> [!CAUTION]
> **`box-swift-sdk-gen` is deprecated and no longer maintained.** As of September 17, 2025, it receives no new features, bug fixes, or security patches. Do not use it for new projects.
>
> Use [`box-ios-sdk`](https://github.com/box/box-ios-sdk) v10+ instead: add `https://github.com/box/box-ios-sdk.git` with Swift Package Manager, or `pod 'BoxSDK', '>= 10.0.0'` with CocoaPods.
> The equivalent of this page is [box-ios-sdk/docs/RecentItems.md](https://github.com/box/box-ios-sdk/blob/main/docs/RecentItems.md). To migrate existing code, see the [migration guide](https://github.com/box/box-ios-sdk/blob/main/migration-guides/from-box-swift-sdk-gen-v0-to-box-ios-sdk.md).


- [List recently accessed items](#list-recently-accessed-items)

## List recently accessed items

Returns information about the recent items accessed
by a user, either in the last 90 days or up to the last
1000 items accessed.

This operation is performed by calling function `getRecentItems`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-recent-items/).

<!-- sample get_recent_items -->
```
try await client.recentItems.getRecentItems()
```

### Arguments

- queryParams `GetRecentItemsQueryParams`
  - Query parameters of getRecentItems method
- headers `GetRecentItemsHeaders`
  - Headers of getRecentItems method


### Returns

This function returns a value of type `RecentItems`.

Returns a list recent items access by a user.


