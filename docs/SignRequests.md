# SignRequestsManager


- [Cancel sign request](#cancel-sign-request)
- [Resend sign request](#resend-sign-request)
- [Get sign request by ID](#get-sign-request-by-id)
- [List sign requests](#list-sign-requests)
- [Create sign request](#create-sign-request)

## Cancel sign request

Cancels a sign request.

This operation is performed by calling function `cancelSignRequest`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-sign-requests-id-cancel/).

*Currently we don't have an example for calling `cancelSignRequest` in integration tests*

### Arguments

- signRequestId `String`
  - The ID of the sign request Example: "33243242"
- headers `CancelSignRequestHeadersArg`
  - Headers of cancelSignRequest method


### Returns

This function returns a value of type `SignRequest`.

Returns a Sign Request object.


## Resend sign request

Resends a sign request email to all outstanding signers.

This operation is performed by calling function `resendSignRequest`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-sign-requests-id-resend/).

*Currently we don't have an example for calling `resendSignRequest` in integration tests*

### Arguments

- signRequestId `String`
  - The ID of the sign request Example: "33243242"
- headers `ResendSignRequestHeadersArg`
  - Headers of resendSignRequest method


### Returns

This function returns a value of type ``.

Returns an empty response when the API call was successful.
The email notifications will be sent asynchronously.


## Get sign request by ID

Gets a sign request by ID.

This operation is performed by calling function `getSignRequestById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-sign-requests-id/).

*Currently we don't have an example for calling `getSignRequestById` in integration tests*

### Arguments

- signRequestId `String`
  - The ID of the sign request Example: "33243242"
- headers `GetSignRequestByIdHeadersArg`
  - Headers of getSignRequestById method


### Returns

This function returns a value of type `SignRequest`.

Returns a sign request


## List sign requests

Gets sign requests created by a user. If the `sign_files` and/or
`parent_folder` are deleted, the sign request will not return in the list.

This operation is performed by calling function `getSignRequests`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-sign-requests/).

*Currently we don't have an example for calling `getSignRequests` in integration tests*

### Arguments

- queryParams `GetSignRequestsQueryParamsArg`
  - Query parameters of getSignRequests method
- headers `GetSignRequestsHeadersArg`
  - Headers of getSignRequests method


### Returns

This function returns a value of type `SignRequests`.

Returns a collection of sign requests


## Create sign request

Creates a sign request. This involves preparing a document for signing and
sending the sign request to signers.

This operation is performed by calling function `createSignRequest`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-sign-requests/).

*Currently we don't have an example for calling `createSignRequest` in integration tests*

### Arguments

- requestBody `SignRequestCreateRequest`
  - Request body of createSignRequest method
- headers `CreateSignRequestHeadersArg`
  - Headers of createSignRequest method


### Returns

This function returns a value of type `SignRequest`.

Returns a Sign Request object.


