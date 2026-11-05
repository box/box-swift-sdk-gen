# TermsOfServiceUserStatusesManager

<!-- box-swift-sdk-gen deprecation banner -->
> [!CAUTION]
> **`box-swift-sdk-gen` is deprecated and no longer maintained.** As of September 17, 2025, it receives no new features, bug fixes, or security patches. Do not use it for new projects.
>
> Use [`box-ios-sdk`](https://github.com/box/box-ios-sdk) v10+ instead: add `https://github.com/box/box-ios-sdk.git` with Swift Package Manager, or `pod 'BoxSDK', '>= 10.0.0'` with CocoaPods.
> The equivalent of this page is [box-ios-sdk/docs/TermsOfServiceUserStatuses.md](https://github.com/box/box-ios-sdk/blob/main/docs/TermsOfServiceUserStatuses.md). To migrate existing code, see the [migration guide](https://github.com/box/box-ios-sdk/blob/main/migration-guides/from-box-swift-sdk-gen-v0-to-box-ios-sdk.md).


- [List terms of service user statuses](#list-terms-of-service-user-statuses)
- [Create terms of service status for new user](#create-terms-of-service-status-for-new-user)
- [Update terms of service status for existing user](#update-terms-of-service-status-for-existing-user)

## List terms of service user statuses

Retrieves an overview of users and their status for a
terms of service, including Whether they have accepted
the terms and when.

This operation is performed by calling function `getTermsOfServiceUserStatuses`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-terms-of-service-user-statuses/).

<!-- sample get_terms_of_service_user_statuses -->
```
try await client.termsOfServiceUserStatuses.getTermsOfServiceUserStatuses(queryParams: GetTermsOfServiceUserStatusesQueryParams(tosId: tos.id, userId: user.id))
```

### Arguments

- queryParams `GetTermsOfServiceUserStatusesQueryParams`
  - Query parameters of getTermsOfServiceUserStatuses method
- headers `GetTermsOfServiceUserStatusesHeaders`
  - Headers of getTermsOfServiceUserStatuses method


### Returns

This function returns a value of type `TermsOfServiceUserStatuses`.

Returns a list of terms of service statuses.


## Create terms of service status for new user

Sets the status for a terms of service for a user.

This operation is performed by calling function `createTermsOfServiceStatusForUser`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-terms-of-service-user-statuses/).

<!-- sample post_terms_of_service_user_statuses -->
```
try await client.termsOfServiceUserStatuses.createTermsOfServiceStatusForUser(requestBody: CreateTermsOfServiceStatusForUserRequestBody(tos: CreateTermsOfServiceStatusForUserRequestBodyTosField(id: tos.id), user: CreateTermsOfServiceStatusForUserRequestBodyUserField(id: user.id), isAccepted: false))
```

### Arguments

- requestBody `CreateTermsOfServiceStatusForUserRequestBody`
  - Request body of createTermsOfServiceStatusForUser method
- headers `CreateTermsOfServiceStatusForUserHeaders`
  - Headers of createTermsOfServiceStatusForUser method


### Returns

This function returns a value of type `TermsOfServiceUserStatus`.

Returns a terms of service status object.


## Update terms of service status for existing user

Updates the status for a terms of service for a user.

This operation is performed by calling function `updateTermsOfServiceStatusForUserById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/put-terms-of-service-user-statuses-id/).

<!-- sample put_terms_of_service_user_statuses_id -->
```
try await client.termsOfServiceUserStatuses.updateTermsOfServiceStatusForUserById(termsOfServiceUserStatusId: createdTosUserStatus.id, requestBody: UpdateTermsOfServiceStatusForUserByIdRequestBody(isAccepted: true))
```

### Arguments

- termsOfServiceUserStatusId `String`
  - The ID of the terms of service status. Example: "324234"
- requestBody `UpdateTermsOfServiceStatusForUserByIdRequestBody`
  - Request body of updateTermsOfServiceStatusForUserById method
- headers `UpdateTermsOfServiceStatusForUserByIdHeaders`
  - Headers of updateTermsOfServiceStatusForUserById method


### Returns

This function returns a value of type `TermsOfServiceUserStatus`.

Returns the updated terms of service status object.


