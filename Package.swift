// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BoxSDK",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "BoxSDK",
            targets: ["BoxSDK"]
        )
    ],
    targets: [
        .target(
            name: "BoxSDK",
            dependencies: [],
            path: "Sources", exclude: ["Info.plist"]
        )
    ]
)