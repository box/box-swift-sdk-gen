# HubItemsManager


- [Get hub items](#get-hub-items)
- [Manage hub items](#manage-hub-items)

## Get hub items

Retrieves all items associated with a Hub.

This operation is performed by calling function `getHubItemsV2025R0`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/v2025.0/get-hub-items/).

<!-- sample get_hub_items_v2025.0 -->
```
try await client.hubItems.getHubItemsV2025R0(queryParams: GetHubItemsV2025R0QueryParams(hubId: createdHub.id))
```

### Arguments

- queryParams `GetHubItemsV2025R0QueryParams`
  - Query parameters of getHubItemsV2025R0 method
- headers `GetHubItemsV2025R0Headers`
  - Headers of getHubItemsV2025R0 method


### Returns

This function returns a value of type `HubItemsV2025R0`.

Retrieves the items associated with the specified Hub.


## Manage hub items

Adds and/or removes Hub items from a Hub.

This operation is performed by calling function `manageHubItemsV2025R0`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/v2025.0/post-hubs-id-manage-items/).

*Currently we don't have an example for calling `manageHubItemsV2025R0` in integration tests*

### Arguments

- hubId `String`
  - The unique identifier that represent a hub.  The ID for any hub can be determined by visiting this hub in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/hubs/123` the `hub_id` is `123`. Example: "12345"
- requestBody `HubItemsManageRequestV2025R0`
  - Request body of manageHubItemsV2025R0 method
- headers `ManageHubItemsV2025R0Headers`
  - Headers of manageHubItemsV2025R0 method


### Returns

This function returns a value of type `HubItemsManageResponseV2025R0`.




