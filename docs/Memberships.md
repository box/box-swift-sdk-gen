# MembershipsManager


- [List user's groups](#list-users-groups)
- [List members of group](#list-members-of-group)
- [Add user to group](#add-user-to-group)
- [Get group membership](#get-group-membership)
- [Update group membership](#update-group-membership)
- [Remove user from group](#remove-user-from-group)

## List user's groups

Retrieves all the groups for a user. Only members of this
group or users with admin-level permissions will be able to
use this API.

This operation is performed by calling function `getUserMemberships`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-users-id-memberships/).

*Currently we don't have an example for calling `getUserMemberships` in integration tests*

### Arguments

- userId `String`
  - The ID of the user. Example: "12345"
- queryParams `GetUserMembershipsQueryParamsArg`
  - Query parameters of getUserMemberships method
- headers `GetUserMembershipsHeadersArg`
  - Headers of getUserMemberships method


### Returns

This function returns a value of type `GroupMemberships`.

Returns a collection of membership objects. If there are no
memberships, an empty collection will be returned.


## List members of group

Retrieves all the members for a group. Only members of this
group or users with admin-level permissions will be able to
use this API.

This operation is performed by calling function `getGroupMemberships`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-groups-id-memberships/).

*Currently we don't have an example for calling `getGroupMemberships` in integration tests*

### Arguments

- groupId `String`
  - The ID of the group. Example: "57645"
- queryParams `GetGroupMembershipsQueryParamsArg`
  - Query parameters of getGroupMemberships method
- headers `GetGroupMembershipsHeadersArg`
  - Headers of getGroupMemberships method


### Returns

This function returns a value of type `GroupMemberships`.

Returns a collection of membership objects. If there are no
memberships, an empty collection will be returned.


## Add user to group

Creates a group membership. Only users with
admin-level permissions will be able to use this API.

This operation is performed by calling function `createGroupMembership`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-group-memberships/).

*Currently we don't have an example for calling `createGroupMembership` in integration tests*

### Arguments

- requestBody `CreateGroupMembershipRequestBodyArg`
  - Request body of createGroupMembership method
- queryParams `CreateGroupMembershipQueryParamsArg`
  - Query parameters of createGroupMembership method
- headers `CreateGroupMembershipHeadersArg`
  - Headers of createGroupMembership method


### Returns

This function returns a value of type `GroupMembership`.

Returns a new group membership object.


## Get group membership

Retrieves a specific group membership. Only admins of this
group or users with admin-level permissions will be able to
use this API.

This operation is performed by calling function `getGroupMembershipById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/get-group-memberships-id/).

*Currently we don't have an example for calling `getGroupMembershipById` in integration tests*

### Arguments

- groupMembershipId `String`
  - The ID of the group membership. Example: "434534"
- queryParams `GetGroupMembershipByIdQueryParamsArg`
  - Query parameters of getGroupMembershipById method
- headers `GetGroupMembershipByIdHeadersArg`
  - Headers of getGroupMembershipById method


### Returns

This function returns a value of type `GroupMembership`.

Returns the group membership object.


## Update group membership

Updates a user's group membership. Only admins of this
group or users with admin-level permissions will be able to
use this API.

This operation is performed by calling function `updateGroupMembershipById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/put-group-memberships-id/).

*Currently we don't have an example for calling `updateGroupMembershipById` in integration tests*

### Arguments

- groupMembershipId `String`
  - The ID of the group membership. Example: "434534"
- requestBody `UpdateGroupMembershipByIdRequestBodyArg`
  - Request body of updateGroupMembershipById method
- queryParams `UpdateGroupMembershipByIdQueryParamsArg`
  - Query parameters of updateGroupMembershipById method
- headers `UpdateGroupMembershipByIdHeadersArg`
  - Headers of updateGroupMembershipById method


### Returns

This function returns a value of type `GroupMembership`.

Returns a new group membership object.


## Remove user from group

Deletes a specific group membership. Only admins of this
group or users with admin-level permissions will be able to
use this API.

This operation is performed by calling function `deleteGroupMembershipById`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/delete-group-memberships-id/).

*Currently we don't have an example for calling `deleteGroupMembershipById` in integration tests*

### Arguments

- groupMembershipId `String`
  - The ID of the group membership. Example: "434534"
- headers `DeleteGroupMembershipByIdHeadersArg`
  - Headers of deleteGroupMembershipById method


### Returns

This function returns a value of type ``.

A blank response is returned if the membership was
successfully deleted.


