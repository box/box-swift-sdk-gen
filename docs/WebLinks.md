# WebLinksManager


- [Create web link](#create-web-link)
- [Get web link](#get-web-link)
- [Update web link](#update-web-link)
- [Remove web link](#remove-web-link)

## Create web link

Creates a web link object within a folder.

This operation is performed by calling function `createWebLink`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-web-links/).

*Currently we don't have an example for calling `createWebLink` in integration tests*

### Arguments

- requestBody `CreateWebLinkRequestBodyArg`
  - Request body of createWebLink method
- headers `CreateWebLinkHeadersArg`
  - Headers of createWebLink method


### Returns

This function returns a value of type `WebLink`.

Returns the newly created web link object.


## Get web link

Retrieve information about a web link.

This operation is performed by calling function `getWebLinkById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-web-links-id/).

*Currently we don't have an example for calling `getWebLinkById` in integration tests*

### Arguments

- webLinkId `String`
  - The ID of the web link. Example: "12345"
- headers `GetWebLinkByIdHeadersArg`
  - Headers of getWebLinkById method


### Returns

This function returns a value of type `WebLink`.

Returns the web link object.


## Update web link

Updates a web link object.

This operation is performed by calling function `updateWebLinkById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/put-web-links-id/).

*Currently we don't have an example for calling `updateWebLinkById` in integration tests*

### Arguments

- webLinkId `String`
  - The ID of the web link. Example: "12345"
- requestBody `UpdateWebLinkByIdRequestBodyArg`
  - Request body of updateWebLinkById method
- headers `UpdateWebLinkByIdHeadersArg`
  - Headers of updateWebLinkById method


### Returns

This function returns a value of type `WebLink`.

Returns the updated web link object.


## Remove web link

Deletes a web link.

This operation is performed by calling function `deleteWebLinkById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/delete-web-links-id/).

*Currently we don't have an example for calling `deleteWebLinkById` in integration tests*

### Arguments

- webLinkId `String`
  - The ID of the web link. Example: "12345"
- headers `DeleteWebLinkByIdHeadersArg`
  - Headers of deleteWebLinkById method


### Returns

This function returns a value of type ``.

An empty response will be returned when the web link
was successfully deleted.


