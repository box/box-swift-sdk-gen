<p align="center">
  <img src="https://github.com/box/sdks/blob/master/images/box-dev-logo.png" alt= “box-dev-logo” width="30%" height="50%">
</p>

# Deprecation notice

> [!CAUTION]
> **`box-swift-sdk-gen` is deprecated and no longer maintained. Do not use it for new projects.**
>
> Use [`box-ios-sdk`](https://github.com/box/box-ios-sdk) v10+ instead: add `https://github.com/box/box-ios-sdk.git` with Swift Package Manager, or `pod 'BoxSDK', '>= 10.0.0'` with CocoaPods.
> To migrate existing code, see the [migration guide](https://github.com/box/box-ios-sdk/blob/main/migration-guides/from-box-swift-sdk-gen-v0-to-box-ios-sdk.md).

As of September 17, 2025, Box Next Generation SDKs are no longer supported as separate artifacts. Your existing code will continue to work without changes, but you won't receive new features, updates, bug fixes, or security patches.

In keeping with industry best practices, we are consolidating the Box Next Generation SDKs and Box core SDKs into a single package. This makes migration easier and allows you to seamlessly add new capabilities to existing applications. Two consolidated versions are available in [box-ios-sdk](https://github.com/box/box-ios-sdk):

- [Version 6](https://github.com/box/box-ios-sdk/tree/combined-sdk) (combined-sdk branch): Contains both `BoxSDK` and `BoxSdkGen` modules for gradual migration.
- [Version 10](https://github.com/box/box-ios-sdk/tree/main) (main branch): The latest major release containing only `BoxSdkGen`.

For more details, see our [SDK versioning strategy document](https://developer.box.com/guides/tooling/sdks/sdk-versioning/).

# Box Swift SDK GENERATED

[![Project Status](http://opensource.box.com/badges/deprecated.svg)](http://opensource.box.com/badges)
![build](https://github.com/box/box-swift-sdk-gen/actions/workflows/build_and_test.yml/badge.svg)
[![Platforms](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS_visionOS_Linux-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS_visionOS_Linux-yellowgreen?style=flat-square)
[![Coverage](https://coveralls.io/repos/github/box/box-swift-sdk-gen/badge.svg?branch=main)](https://coveralls.io/github/box/box-swift-sdk-gen?branch=main)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/BoxSdkGen.svg)](https://cocoapods.org/pods/BoxSdkGen)

This library provides access to the [Box Platform API](https://developer.box.com/reference/) from Swift.

# Table of contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Box Swift SDK GENERATED](#box-swift-sdk-generated)
- [Table of contents](#table-of-contents)
- [Installing](#installing)
  - [Swift Package Manager](#swift-package-manager)
  - [Carthage](#carthage)
  - [CocoaPods](#cocoapods)
- [Getting Started](#getting-started)
- [Integration Tests](#integration-tests)
  - [Running integration tests locally](#running-integration-tests-locally)
    - [Create Platform Application](#create-custom-application)
    - [Export configuration](#export-configuration)
    - [Running tests](#running-tests)
- [Questions, Bugs, and Feature Requests?](#questions-bugs-and-feature-requests)
- [Copyright and License](#copyright-and-license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Installing

> [!CAUTION]
> This package is deprecated. For new projects, install [`box-ios-sdk`](https://github.com/box/box-ios-sdk) instead: add `https://github.com/box/box-ios-sdk.git` with Swift Package Manager, or `pod 'BoxSDK', '>= 10.0.0'` with CocoaPods.

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

## CocoaPods

CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects.
To start using `BoxSdkGen` with CocoaPods, you need to add `BoxSdkGen` dependency to your `Podfile`:

```shell
pod 'BoxSdkGen'
```

Then run the following command in your project directory:

```shell
$ pod install
```

Now open your [project].xcworkspace and build.

For more detailed instructions, please see the [official documentation for Cocoapods](https://guides.cocoapods.org/using/using-cocoapods.html).

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

# Integration Tests

## Running integration tests locally

### Create Platform Application

To run integration tests locally you will need a `Custom App` created in the [Box Developer
Console](https://app.box.com/developers/console)
with `Server Authentication (Client Credentials Grant)` selected as authentication method.
Once created you can edit properties of the application:

- In section `App Access Level` select `App + Enterprise Access`. You can enable all `Application Scopes`.
- In section `Advanced Features` enable `Make API calls using the as-user header` and `Generate user access tokens`.

Now select `Authorization` and submit application to be reviewed by account admin.

### Export configuration

To run integration tests, you need several environment variables specifying your account and the Box application you've created.

1. Set the `CLIENT_ID` environment variable to its corresponding value from the `Configuration` tab in the section `OAuth 2.0 Credentials` of your application.
2. Set the `CLIENT_SECRET` environment variable to its corresponding value from the `Configuration` tab in the section `OAuth 2.0 Credentials` of your application.
3. Set the `ENTERPRISE_ID` environment variable to its corresponding value from the `General Settings` tab the section `App Info` of your application.
4. Set the `USER_ID` environment variable to its corresponding value from the `General Settings` tab the section `App Info` of your application.
5. Set the `BOX_FILE_REQUEST_ID` environment variable to the ID of file request already created in the user account, `BOX_EXTERNAL_USER_EMAIL` with email of free external user which not belongs to any enterprise.
6. Set the `WORKFLOW_FOLDER_ID` environment variable to the ID of the Relay workflow that deletes the file that triggered the workflow. The workflow should have a manual start to be able to start it from the API.
7. Set environment variable: `APP_ITEM_ASSOCIATION_FILE_ID` to the ID of the file with associated app item and `APP_ITEM_ASSOCIATION_FOLDER_ID` to the ID of the folder with associated app item.
8. Set environment variable: `APP_ITEM_SHARED_LINK` to the shared link associated with app item.
9. Set environment variable: `SLACK_AUTOMATION_USER_ID` to the ID of the user responsible for the Slack automation.
10. Set environment variable: `SLACK_ORG_ID` to the ID of the Slack organization.
11. Set environment variable: `SLACK_PARTNER_ITEM_ID` to the ID of the Slack partner item.

### Running tests

To run integration tests locally:

1. `swift test`

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
