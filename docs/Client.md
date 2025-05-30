# Client

This is the central entrypoint for all SDK interaction. The BoxClient houses all the API endpoints
divided across resource managers.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Client](#client)
- [Make custom HTTP request](#make-custom-http-request)
  - [JSON request](#json-request)
  - [Multi-part request](#multi-part-request)
  - [Binary response](#binary-response)
- [Additional headers](#additional-headers)
  - [As-User header](#as-user-header)
  - [Suppress notifications](#suppress-notifications)
  - [Custom headers](#custom-headers)
- [Custom Base URLs](#custom-base-urls)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Make custom HTTP request

You can make custom HTTP requests using the `client.makeRequest()` method.
This method allows you to make any HTTP request to the Box API. It will automatically use authentication and
network configuration settings from the client.
The method accepts a `FetchOptions` object as an argument and returns a `FetchResponse` object.

## JSON request

The following example demonstrates how to make a custom POST request to create a new folder in the root folder.

```swift
let requestBodyPost: String = "\("{\"name\": \"myFolderName\", \"parent\": { \"id\": \"0\"}}")"
let response: FetchResponse = try await client.makeRequest(
    fetchOptions: FetchOptions(
        url: "https://api.box.com/2.0/folders",
        method: "POST",
        data: JsonUtils.jsonToSerializedData(text: requestBodyPost)
    )
)

let responseContent = String(data: response.data?.data ?? Data(), encoding: .utf8) ?? ""
print("Received status code: \(response.status)")
print("Response content: \(responseContent)")

// We can also deserialize the response content to json dictionary so we can access the values by key
if let jsonDict = JsonUtils.sdToJsonDictionary(from: response.data) {
    print("Created folder name: \(jsonDict["name"] ?? "")" )
}
```

## Multi-part request

The following example demonstrates how to make a custom multipart request that uploads a file to a folder.

```swift
let multipartAttributes: String = "\("{\"name\": \"newFileName\", \"parent\": { \"id\":\"0\"}}")"

guard let fileContentStream = InputStream(url: URL(string: "<URL_TO_YOUR_FILE>")!) else {
    fatalError("Could not read a file")
}

let multipartItems = [
    MultipartItem(partName: "attributes", data: JsonUtils.jsonToSerializedData(text: multipartAttributes)),
    MultipartItem(partName: "file", fileStream: fileContentStream)
]

let response: FetchResponse = try await client.makeRequest(
    fetchOptions: FetchOptions(
        url: "https://upload.box.com/api/2.0/files/content",
        method: "POST",
        multipartData: multipartItems,
        contentType: "multipart/form-data"
    )
)

print("Received status code: \(response.status)")
```

## Binary response

The following example demonstrates how to make a custom request to download a file.
You must specify the `responseFormat` parameter in the `FetchOptions` object as `ResponseFormat.binary`
and set the `downloadDestinationUrl` parameter to indicate where the file should be saved.

```swift
// Path to the file where the downloaded content will be saved
let downloadPathString: String = "\(Utils.temporaryDirectoryPath())\(Utils.getUUID())"
let fileId = "123456789";

let response: FetchResponse = try await client.makeRequest(
    fetchOptions: FetchOptions(
        url: "\("https://api.box.com/2.0/files/")\(fileId)\("/content")",
        method: "GET",
        responseFormat: ResponseFormat.binary,
        downloadDestinationUrl: URL(path: downloadPathString)
    )
)

print("Received status code: \(response.status)")

// If the request is successful, the file content will be saved to the specified path
if response.status == 200 {
    if let url = URL(string: downloadPathString), let data = try? Data(contentsOf: url){
        print("File content: \(String(decoding: data, as: UTF8.self))")
    }
}
```

# Additional headers

BoxClient provides a convenient method, which allow passing additional headers, which will be included
in every API call made by the client.

## As-User header

The As-User header is used by enterprise admins to make API calls on behalf of their enterprise's users.
This requires the API request to pass an As-User: USER-ID header. For more details see the [documentation on As-User](https://developer.box.com/en/guides/authentication/oauth2/as-user/).

The following example assume that the client has been instantiated with an access token belonging to an admin-level user
or Service Account with appropriate privileges to make As-User calls.

Calling the `client.withAsUserHeader()` method creates a new client to impersonate user with the provided ID.
All calls made with the new client will be made in context of the impersonated user, leaving the original client unmodified.

<!-- sample x_auth init_with_as_user_header -->

```swift
let userClient = client.withAsUserHeader(userId: '1234567')
```

## Suppress notifications

If you are making administrative API calls (that is, your application has “Manage an Enterprise”
scope, and the user signing in is a co-admin with the correct "Edit settings for your company"
permission) then you can suppress both email and webhook notifications. This can be used, for
example, for a virus-scanning tool to download copies of everyone’s files in an enterprise,
without every collaborator on the file getting an email. All actions will still appear in users'
updates feed and audit logs.

> **Note:** This functionality is only available for approved applications.

Calling the `client.withSuppressedNotifications()` method creates a new client.
For all calls made with the new client the notifications will be suppressed.

```swift
let newClient = client.withSuppressedNotifications()
```

## Custom headers

You can also specify the custom set of headers, which will be included in every API call made by client.
Calling the `client.withExtraHeaders()` method creates a new client, leaving the original client unmodified.

```swift
let newClient = client.withExtraHeaders(extraHeaders: ["customHeader": "customValue"])
```

# Custom Base URLs

You can also specify the custom base URLs, which will be used for API calls made by client.
Calling the `client.withCustomBaseUrls()` method creates a new client, leaving the original client unmodified.

```swift
let newClient = client.withCustomBaseUrls(baseUrls: BaseUrls(
  baseUrl: "https://api.box.com",
  uploadUrl: "https://upload.box.com/api",
  oauth2Url: "https://account.box.com/api/oauth2"
))
```
