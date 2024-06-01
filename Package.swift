// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DPSwiftUI",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DPSwiftUI",
            targets: ["DPSwiftUI"]
        ),
    ],
    targets: [
        .target(
            name: "DPSwiftUI"),
        .testTarget(
            name: "DPSwiftUITests",
            dependencies: ["DPSwiftUI"]
        ),
    ]
)
