# Uploads

<!-- box-swift-sdk-gen deprecation banner -->
> [!CAUTION]
> **`box-swift-sdk-gen` is deprecated and no longer maintained.** As of September 17, 2025, it receives no new features, bug fixes, or security patches. Do not use it for new projects.
>
> Use [`box-ios-sdk`](https://github.com/box/box-ios-sdk) v10+ instead: add `https://github.com/box/box-ios-sdk.git` with Swift Package Manager, or `pod 'BoxSDK', '>= 10.0.0'` with CocoaPods.
> The equivalent of this page is [box-ios-sdk/docs/Uploads.md](https://github.com/box/box-ios-sdk/blob/main/docs/Uploads.md). To migrate existing code, see the [migration guide](https://github.com/box/box-ios-sdk/blob/main/migration-guides/from-box-swift-sdk-gen-v0-to-box-ios-sdk.md).

Uploads module is used to upload files to Box.
It supports uploading files from an `InputStream`.
For now, it only supports uploading small files without chunked upload.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Upload a File](#upload-a-file)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Upload a File

To upload a small file from an `InputStream`, call `client.uploads.uploadFile(requestBody:queryParams:headers)` method.
This method returns a `Files` object which contains information about the uploaded files.

<!-- sample post_files_content -->

```swift
// Create InputStream for a file based on URL
guard let fileStream = InputStream(url: URL(string: "<URL_TO_YOUR_FILE>")!) else {
    fatalError("Could not read a file")
}

// Create a request body with the required parameters
let requestBody = UploadFileRequestBodyArg(
    attributes: UploadFileRequestBodyArgAttributesField(
        name: "filename.txt",
        parent: UploadFileRequestBodyArgAttributesFieldParentField(id: "0")
    ),
    file: fileStream
)

// Call uploadFile method
let files = try await client.uploads.uploadFile(requestBody: requestBody)

// Print some data from the reponse
if let file = files.entries?[0] {
    print("File uploaded with id \(file.id), name \(file.name!)")
}
```

If we want to upload a file based on the String type, we need to create an input stream as follows:

```swift
let stringContent: String = "File content from String"
let data: Data = stringContent.data(using: .utf8)!
let stream: InputStream = InputStream(data: data)
```

Then we just pass the created `stream` to the `file` argument when initializing the `UploadFileRequestBodyArg` object.
