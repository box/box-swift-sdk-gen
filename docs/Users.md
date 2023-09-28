# UsersManager


- [List enterprise users](#list-enterprise-users)
- [Create user](#create-user)
- [Get current user](#get-current-user)
- [Get user](#get-user)
- [Update user](#update-user)
- [Delete user](#delete-user)

## List enterprise users

Returns a list of all users for the Enterprise along with their `user_id`,
`public_name`, and `login`.

The application and the authenticated user need to
have the permission to look up users in the entire
enterprise.

This operation is performed by calling function `getUsers`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-users/).

*Currently we don't have an example for calling `getUsers` in integration tests*

### Arguments

- queryParams `GetUsersQueryParamsArg`
  - Query parameters of getUsers method
- headers `GetUsersHeadersArg`
  - Headers of getUsers method


### Returns

This function returns a value of type `Users`.

Returns all of the users in the enterprise.


## Create user

Creates a new managed user in an enterprise. This endpoint
is only available to users and applications with the right
admin permissions.

This operation is performed by calling function `createUser`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-users/).

*Currently we don't have an example for calling `createUser` in integration tests*

### Arguments

- requestBody `CreateUserRequestBodyArg`
  - Request body of createUser method
- queryParams `CreateUserQueryParamsArg`
  - Query parameters of createUser method
- headers `CreateUserHeadersArg`
  - Headers of createUser method


### Returns

This function returns a value of type `User`.

Returns a user object for the newly created user.


## Get current user

Retrieves information about the user who is currently authenticated.

In the case of a client-side authenticated OAuth 2.0 application
this will be the user who authorized the app.

In the case of a JWT, server-side authenticated application
this will be the service account that belongs to the application
by default.

Use the `As-User` header to change who this API call is made on behalf of.

This operation is performed by calling function `getUserMe`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-users-me/).

*Currently we don't have an example for calling `getUserMe` in integration tests*

### Arguments

- queryParams `GetUserMeQueryParamsArg`
  - Query parameters of getUserMe method
- headers `GetUserMeHeadersArg`
  - Headers of getUserMe method


### Returns

This function returns a value of type `UserFull`.

Returns a single user object.


## Get user

Retrieves information about a user in the enterprise.

The application and the authenticated user need to
have the permission to look up users in the entire
enterprise.

This endpoint also returns a limited set of information
for external users who are collaborated on content
owned by the enterprise for authenticated users with the
right scopes. In this case, disallowed fields will return
null instead.

This operation is performed by calling function `getUserById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-users-id/).

*Currently we don't have an example for calling `getUserById` in integration tests*

### Arguments

- userId `String`
  - The ID of the user. Example: "12345"
- queryParams `GetUserByIdQueryParamsArg`
  - Query parameters of getUserById method
- headers `GetUserByIdHeadersArg`
  - Headers of getUserById method


### Returns

This function returns a value of type `UserFull`.

Returns a single user object.

Not all available fields are returned by default. Use the
[fields](#param-fields) query parameter to explicitly request
any specific fields using the [fields](#get-users-id--request--fields)
parameter.


## Update user

Updates a managed or app user in an enterprise. This endpoint
is only available to users and applications with the right
admin permissions.

This operation is performed by calling function `updateUserById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/put-users-id/).

*Currently we don't have an example for calling `updateUserById` in integration tests*

### Arguments

- userId `String`
  - The ID of the user. Example: "12345"
- requestBody `UpdateUserByIdRequestBodyArg`
  - Request body of updateUserById method
- queryParams `UpdateUserByIdQueryParamsArg`
  - Query parameters of updateUserById method
- headers `UpdateUserByIdHeadersArg`
  - Headers of updateUserById method


### Returns

This function returns a value of type `UserFull`.

Returns the updated user object.


## Delete user

Deletes a user. By default this will fail if the user
still owns any content. Move their owned content first
before proceeding, or use the `force` field to delete
the user and their files.

This operation is performed by calling function `deleteUserById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/delete-users-id/).

*Currently we don't have an example for calling `deleteUserById` in integration tests*

### Arguments

- userId `String`
  - The ID of the user. Example: "12345"
- queryParams `DeleteUserByIdQueryParamsArg`
  - Query parameters of deleteUserById method
- headers `DeleteUserByIdHeadersArg`
  - Headers of deleteUserById method


### Returns

This function returns a value of type ``.

Removes the user and returns an empty response.


