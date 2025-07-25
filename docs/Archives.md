# ArchivesManager


- [List archives](#list-archives)
- [Create archive](#create-archive)
- [Delete archive](#delete-archive)

## List archives

Retrieves archives for an enterprise.

This operation is performed by calling function `getArchivesV2025R0`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/v2025.0/get-archives/).

*Currently we don't have an example for calling `getArchivesV2025R0` in integration tests*

### Arguments

- queryParams `GetArchivesV2025R0QueryParams`
  - Query parameters of getArchivesV2025R0 method
- headers `GetArchivesV2025R0Headers`
  - Headers of getArchivesV2025R0 method


### Returns

This function returns a value of type `ArchivesV2025R0`.

Returns a list of archives in the enterprise.


## Create archive

Creates an archive.

This operation is performed by calling function `createArchiveV2025R0`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/v2025.0/post-archives/).

*Currently we don't have an example for calling `createArchiveV2025R0` in integration tests*

### Arguments

- requestBody `CreateArchiveV2025R0RequestBody`
  - Request body of createArchiveV2025R0 method
- headers `CreateArchiveV2025R0Headers`
  - Headers of createArchiveV2025R0 method


### Returns

This function returns a value of type `ArchiveV2025R0`.

Returns a new archive object.


## Delete archive

Permanently deletes an archive.

This operation is performed by calling function `deleteArchiveByIdV2025R0`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/v2025.0/delete-archives-id/).

*Currently we don't have an example for calling `deleteArchiveByIdV2025R0` in integration tests*

### Arguments

- archiveId `String`
  - The ID of the archive. Example: "982312"
- headers `DeleteArchiveByIdV2025R0Headers`
  - Headers of deleteArchiveByIdV2025R0 method


### Returns

This function returns a value of type ``.

Returns an empty response when the archive has been deleted.


