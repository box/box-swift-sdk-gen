# AvatarsManager


- [Get user avatar](#get-user-avatar)
- [Add or update user avatar](#add-or-update-user-avatar)
- [Delete user avatar](#delete-user-avatar)

## Get user avatar

Retrieves an image of a the user's avatar.

This operation is performed by calling function `getUserAvatar`.



```
try await client.avatars.getUserAvatar(userId: user.id, downloadDestinationURL: URL(path: "\(Utils.temporaryDirectoryPath())\(Utils.getUUID())"))
```

### Arguments

- userId `String`
  - The ID of the user. Example: "12345"
- downloadDestinationURL `URL`
  - The URL on disk where the file will be saved once it has been downloaded.
- headers `GetUserAvatarHeaders`
  - Headers of getUserAvatar method


### Returns

This function returns a value of type `URL`.

When an avatar can be found for the user the
image data will be returned in the body of the
response.


## Add or update user avatar

Adds or updates a user avatar.

This operation is performed by calling function `createUserAvatar`.



```
try await client.avatars.createUserAvatar(userId: user.id, requestBody: CreateUserAvatarRequestBody(pic: Utils.decodeBase64ByteStream(data: "iVBORw0KGgoAAAANSUhEUgAAAQAAAAEAAQMAAABmvDolAAAAA1BMVEW10NBjBBbqAAAAH0lEQVRoge3BAQ0AAADCoPdPbQ43oAAAAAAAAAAAvg0hAAABmmDh1QAAAABJRU5ErkJggg=="), picContentType: "image/png", picFileName: "avatar.png"))
```

### Arguments

- userId `String`
  - The ID of the user. Example: "12345"
- requestBody `CreateUserAvatarRequestBody`
  - Request body of createUserAvatar method
- headers `CreateUserAvatarHeaders`
  - Headers of createUserAvatar method


### Returns

This function returns a value of type `UserAvatar`.

* `ok`: Returns the `pic_urls` object with URLs to existing
user avatars that were updated.* `created`: Returns the `pic_urls` object with URLS to user avatars
uploaded to Box with the request.


## Delete user avatar

Removes an existing user avatar.
You cannot reverse this operation.

This operation is performed by calling function `deleteUserAvatar`.



```
try await client.avatars.deleteUserAvatar(userId: user.id)
```

### Arguments

- userId `String`
  - The ID of the user. Example: "12345"
- headers `DeleteUserAvatarHeaders`
  - Headers of deleteUserAvatar method


### Returns

This function returns a value of type ``.

* `no_content`: Removes the avatar and returns an empty response.


