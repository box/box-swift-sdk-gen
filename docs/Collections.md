# CollectionsManager


- [List all collections](#list-all-collections)
- [List collection items](#list-collection-items)

## List all collections

Retrieves all collections for a given user.

Currently, only the `favorites` collection
is supported.

This operation is performed by calling function `getCollections`.



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

Returns all collections for the given user


## List collection items

Retrieves the files and/or folders contained within
this collection.

This operation is performed by calling function `getCollectionItems`.



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

This function returns a value of type `Items`.

Returns an array of items in the collection.


