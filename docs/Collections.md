# CollectionsManager

<!-- box-swift-sdk-gen deprecation banner -->
> [!CAUTION]
> **`box-swift-sdk-gen` is deprecated and no longer maintained.** As of September 17, 2025, it receives no new features, bug fixes, or security patches. Do not use it for new projects.
>
> Use [`box-ios-sdk`](https://github.com/box/box-ios-sdk) v10+ instead: add `https://github.com/box/box-ios-sdk.git` with Swift Package Manager, or `pod 'BoxSDK', '>= 10.0.0'` with CocoaPods.
> The equivalent of this page is [box-ios-sdk/docs/Collections.md](https://github.com/box/box-ios-sdk/blob/main/docs/Collections.md). To migrate existing code, see the [migration guide](https://github.com/box/box-ios-sdk/blob/main/migration-guides/from-box-swift-sdk-gen-v0-to-box-ios-sdk.md).


- [List all collections](#list-all-collections)
- [List collection items](#list-collection-items)
- [Get collection by ID](#get-collection-by-id)

## List all collections

Retrieves all collections for a given user.

Currently, only the `favorites` collection
is supported.

This operation is performed by calling function `getCollections`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-collections/).

<!-- sample get_collections -->
```
try await client.collections.getCollections()
```

### Arguments

- queryParams `GetCollectionsQueryParams`
  - Query parameters of getCollections method
- headers `GetCollectionsHeaders`
  - Headers of getCollections method


### Returns

This function returns a value of type `Collections`.

Returns all collections for the given user.


## List collection items

Retrieves the files and/or folders contained within
this collection.

This operation is performed by calling function `getCollectionItems`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-collections-id-items/).

<!-- sample get_collections_id_items -->
```
try await client.collections.getCollectionItems(collectionId: favouriteCollection.id!)
```

### Arguments

- collectionId `String`
  - The ID of the collection. Example: "926489"
- queryParams `GetCollectionItemsQueryParams`
  - Query parameters of getCollectionItems method
- headers `GetCollectionItemsHeaders`
  - Headers of getCollectionItems method


### Returns

This function returns a value of type `ItemsOffsetPaginated`.

Returns an array of items in the collection.


## Get collection by ID

Retrieves a collection by its ID.

This operation is performed by calling function `getCollectionById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-collections-id/).

<!-- sample get_collections_id -->
```
try await client.collections.getCollectionById(collectionId: collections.entries![0].id!)
```

### Arguments

- collectionId `String`
  - The ID of the collection. Example: "926489"
- headers `GetCollectionByIdHeaders`
  - Headers of getCollectionById method


### Returns

This function returns a value of type `Collection`.

Returns an array of items in the collection.


