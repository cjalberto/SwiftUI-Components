// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftNesComponents",
    platforms: [
        .iOS(.v14)
    ],
    targets: [
        .target(
            name: "Components",
            dependencies: []),
        .testTarget(
            name: "SwiftNesComponentsTests",
            dependencies: ["Components"]),
    ]
)
