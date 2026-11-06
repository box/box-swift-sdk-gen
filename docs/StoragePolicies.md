# StoragePoliciesManager

<!-- box-swift-sdk-gen deprecation banner -->
> [!CAUTION]
> **`box-swift-sdk-gen` is deprecated and no longer maintained.** As of September 17, 2025, it receives no new features, bug fixes, or security patches. Do not use it for new projects.
>
> Use [`box-ios-sdk`](https://github.com/box/box-ios-sdk) v10+ instead: add `https://github.com/box/box-ios-sdk.git` with Swift Package Manager, or `pod 'BoxSDK', '>= 10.0.0'` with CocoaPods.
> The equivalent of this page is [box-ios-sdk/docs/StoragePolicies.md](https://github.com/box/box-ios-sdk/blob/main/docs/StoragePolicies.md). To migrate existing code, see the [migration guide](https://github.com/box/box-ios-sdk/blob/main/migration-guides/from-box-swift-sdk-gen-v0-to-box-ios-sdk.md).


- [List storage policies](#list-storage-policies)
- [Get storage policy](#get-storage-policy)

## List storage policies

Fetches all the storage policies in the enterprise.

This operation is performed by calling function `getStoragePolicies`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-storage-policies/).

<!-- sample get_storage_policies -->
```
try await client.storagePolicies.getStoragePolicies()
```

### Arguments

- queryParams `GetStoragePoliciesQueryParams`
  - Query parameters of getStoragePolicies method
- headers `GetStoragePoliciesHeaders`
  - Headers of getStoragePolicies method


### Returns

This function returns a value of type `StoragePolicies`.

Returns a collection of storage policies.


## Get storage policy

Fetches a specific storage policy.

This operation is performed by calling function `getStoragePolicyById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-storage-policies-id/).

<!-- sample get_storage_policies_id -->
```
try await client.storagePolicies.getStoragePolicyById(storagePolicyId: storagePolicy.id)
```

### Arguments

- storagePolicyId `String`
  - The ID of the storage policy. Example: "34342"
- headers `GetStoragePolicyByIdHeaders`
  - Headers of getStoragePolicyById method


### Returns

This function returns a value of type `StoragePolicy`.

Returns a storage policy object.


