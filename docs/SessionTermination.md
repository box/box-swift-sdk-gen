# SessionTerminationManager

<!-- box-swift-sdk-gen deprecation banner -->
> [!CAUTION]
> **`box-swift-sdk-gen` is deprecated and no longer maintained.** As of September 17, 2025, it receives no new features, bug fixes, or security patches. Do not use it for new projects.
>
> Use [`box-ios-sdk`](https://github.com/box/box-ios-sdk) v10+ instead: add `https://github.com/box/box-ios-sdk.git` with Swift Package Manager, or `pod 'BoxSDK', '>= 10.0.0'` with CocoaPods.
> The equivalent of this page is [box-ios-sdk/docs/SessionTermination.md](https://github.com/box/box-ios-sdk/blob/main/docs/SessionTermination.md). To migrate existing code, see the [migration guide](https://github.com/box/box-ios-sdk/blob/main/migration-guides/from-box-swift-sdk-gen-v0-to-box-ios-sdk.md).


- [Create jobs to terminate users session](#create-jobs-to-terminate-users-session)
- [Create jobs to terminate user group session](#create-jobs-to-terminate-user-group-session)

## Create jobs to terminate users session

Validates the roles and permissions of the user,
and creates asynchronous jobs
to terminate the user's sessions.
Returns the status for the POST request.

This operation is performed by calling function `terminateUsersSessions`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-users-terminate-sessions/).

<!-- sample post_users_terminate_sessions -->
```
try await client.sessionTermination.terminateUsersSessions(requestBody: TerminateUsersSessionsRequestBody(userIds: [Utils.getEnvironmentVariable(name: "USER_ID")], userLogins: [user.login!]))
```

### Arguments

- requestBody `TerminateUsersSessionsRequestBody`
  - Request body of terminateUsersSessions method
- headers `TerminateUsersSessionsHeaders`
  - Headers of terminateUsersSessions method


### Returns

This function returns a value of type `SessionTerminationMessage`.

Returns a message about the request status.


## Create jobs to terminate user group session

Validates the roles and permissions of the group,
and creates asynchronous jobs
to terminate the group's sessions.
Returns the status for the POST request.

This operation is performed by calling function `terminateGroupsSessions`.

See the endpoint docs at
[API Reference](https://developer.box.com/reference/post-groups-terminate-sessions/).

<!-- sample post_groups_terminate_sessions -->
```
try await client.sessionTermination.terminateGroupsSessions(requestBody: TerminateGroupsSessionsRequestBody(groupIds: [group.id]))
```

### Arguments

- requestBody `TerminateGroupsSessionsRequestBody`
  - Request body of terminateGroupsSessions method
- headers `TerminateGroupsSessionsHeaders`
  - Headers of terminateGroupsSessions method


### Returns

This function returns a value of type `SessionTerminationMessage`.

Returns a message about the request status.


