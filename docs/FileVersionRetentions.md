# FileVersionRetentionsManager

<!-- box-swift-sdk-gen deprecation banner -->
> [!CAUTION]
> **`box-swift-sdk-gen` is deprecated and no longer maintained.** As of September 17, 2025, it receives no new features, bug fixes, or security patches. Do not use it for new projects.
>
> Use [`box-ios-sdk`](https://github.com/box/box-ios-sdk) v10+ instead: add `https://github.com/box/box-ios-sdk.git` with Swift Package Manager, or `pod 'BoxSDK', '>= 10.0.0'` with CocoaPods.
> The equivalent of this page is [box-ios-sdk/docs/FileVersionRetentions.md](https://github.com/box/box-ios-sdk/blob/main/docs/FileVersionRetentions.md). To migrate existing code, see the [migration guide](https://github.com/box/box-ios-sdk/blob/main/migration-guides/from-box-swift-sdk-gen-v0-to-box-ios-sdk.md).


- [List file version retentions](#list-file-version-retentions)
- [Get retention on file](#get-retention-on-file)

## List file version retentions

Retrieves all file version retentions for the given enterprise.

**Note**:
File retention API is now **deprecated**. 
To get information about files and file versions under retention,
see [files under retention](e://get-retention-policy-assignments-id-files-under-retention) or [file versions under retention](e://get-retention-policy-assignments-id-file-versions-under-retention) endpoints.

This operation is performed by calling function `getFileVersionRetentions`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-file-version-retentions/).

<!-- sample get_file_version_retentions -->
```
try await client.fileVersionRetentions.getFileVersionRetentions()
```

### Arguments

- queryParams `GetFileVersionRetentionsQueryParams`
  - Query parameters of getFileVersionRetentions method
- headers `GetFileVersionRetentionsHeaders`
  - Headers of getFileVersionRetentions method


### Returns

This function returns a value of type `FileVersionRetentions`.

Returns a list of all file version retentions for the enterprise.


## Get retention on file

Returns information about a file version retention.

**Note**:
File retention API is now **deprecated**. 
To get information about files and file versions under retention,
see [files under retention](e://get-retention-policy-assignments-id-files-under-retention) or [file versions under retention](e://get-retention-policy-assignments-id-file-versions-under-retention) endpoints.

This operation is performed by calling function `getFileVersionRetentionById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-file-version-retentions-id/).

<!-- sample get_file_version_retentions_id -->
```
try await client.fileVersionRetentions.getFileVersionRetentionById(fileVersionRetentionId: fileVersionRetention.id!)
```

### Arguments

- fileVersionRetentionId `String`
  - The ID of the file version retention. Example: "3424234"
- headers `GetFileVersionRetentionByIdHeaders`
  - Headers of getFileVersionRetentionById method


### Returns

This function returns a value of type `FileVersionRetention`.

Returns a file version retention object.


