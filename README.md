<p align="center">
  <img src="https://github.com/box/sdks/blob/master/images/box-dev-logo.png" alt= “box-dev-logo” width="30%" height="50%">
</p>

# Box Swift SDK GENERATED

We are excited to introduce the latest generation (currently in Beta) of Box Swift SDK Gen, designed to elevate the developer experience and streamline your integration with the Box Content Cloud.

With this SDK, you’ll have access to:

1. Full API Support: The new generation of Box SDKs empowers developers with complete coverage of the Box API ecosystem. You can now access all the latest features and functionalities offered by Box, allowing you to build even more sophisticated and feature-rich applications.
2. Rapid API Updates: Say goodbye to waiting for new Box APIs to be incorporated into the SDK. With our new auto-generation development approach, we can now add new Box APIs to the SDK at a much faster pace (in a matter of days). This means you can leverage the most up-to-date features in your applications without delay.
3. Embedded Documentation: We understand that easy access to information is crucial for developers. With our new approach, we have included comprehensive documentation for all objects and parameters directly in the source code of the SDK. This means you no longer need to look up this information on the developer portal, saving you time and streamlining your development process.
4. Enhanced Convenience Methods: Our commitment to enhancing your development experience continues with the introduction of convenience methods. These methods cover various aspects such as chunk uploads, classification, and much more.
5. Seamless Start: The new SDKs integrate essential functionalities like authentication, automatic retries with exponential backoff, exception handling, request cancellation, and type checking, enabling you to focus solely on your application's business logic.

Embrace the new generation of Box SDKs and unlock the full potential of the Box Content Cloud.

# Table of contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Box Swift SDK GENERATED](#box-swift-sdk-generated)
- [Table of contents](#table-of-contents)
- [Installing](#installing)
  - [Swift Package Manager](#swift-package-manager)
  - [Carthage](#carthage)
- [Getting Started](#getting-started)
- [Questions, Bugs, and Feature Requests?](#questions-bugs-and-feature-requests)
- [Copyright and License](#copyright-and-license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Installing

## Swift Package Manager

The Swift Package Manager is a tool for managing the distribution of Swift code.
It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To add a dependency to your Xcode project, click on Xcode project file on `Packages Dependencies` and click on the plus icon to add a package. Then enter the following repository url https://github.com/box/box-swift-sdk-gen.git and click next.

Alternatively you can add a dependency to the dependencies value of your Package.swift.

For detailed instructions, please see the [official documentation for SPM](https://www.swift.org/package-manager/).

## Carthage

Carthage is a decentralized dependency manager which builds your dependencies and provides you with binary frameworks.

To add a dependency to `BoxSdkGen`, you need to add the following line to your `Cartfile` :

```shell
git "https://github.com/box/box-swift-sdk-gen.git"
```

Then run:

```shell
carthage bootstrap --use-xcframeworks
```

And finally drag the built `xcframework` from Carthage/Build into your project.

For more detailed instructions, please see the [official documentation for Carthage](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application).

# Getting Started

To get started with the SDK, get a Developer Token from the Configuration page of your app in the [Box Developer
Console](https://app.box.com/developers/console). You can use this token to make test calls for your own Box account.

The SDK provides a `BoxDeveloperTokenAuth` class, which allows you to authenticate using your Developer Token.
Use instance of `BoxDeveloperTokenAuth` to initialize `BoxClient` object.
Using `BoxClient` object you can access managers, which allow you to perform some operations on your Box account.

The example below demonstrates how to authenticate with Developer Token and print names of all items inside a root folder.

```swift
import BoxSdkGen

let auth = BoxDeveloperTokenAuth(token: "DEVELOPER_TOKEN_GOES_HERE")
let client = BoxClient(auth: auth)

let items = try await client.folders.getFolderItems(folderId: "0")
if let entries = items.entries {
    for entry in entries {
        switch entry {
        case let .fileMini(file):
            print("file \(file.name!) [\(file.id)]")
        case let .folderMini(folder):
            print("folder \(folder.name!) [\(folder.id)]")
        case let .webLinkMini(webLink):
            print("webLink \(webLink.name!) [\(webLink.id)]")
        }
    }
}
```

The usage docs that show how to make calls to the Box API with the SDK can be found [here](https://github.com/box/box-swift-sdk-gen/tree/main/docs).

We recommend, familiarizing yourself with the remaining [authentication methods](https://github.com/box/box-swift-sdk-gen/tree/main/docs/Authentication.md), [uploading files](https://github.com/box/box-swift-sdk-gen/tree/main/docs/Uploads.md) and [downloading files](https://github.com/box/box-swift-sdk-gen/tree/main/docs/Downloads.md).

# Questions, Bugs, and Feature Requests?

Need to contact us directly? [Browse the issues
tickets](https://github.com/box/box-swift-sdk-gen/issues)! Or, if that
doesn't work, [file a new
one](https://github.com/box/box-swift-sdk-gen/issues/new) and we will get
back to you. If you have general questions about the Box API, you can
post to the [Box Developer Forum](https://forum.box.com/).

# Copyright and License

Copyright 2023 Box, Inc. All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
