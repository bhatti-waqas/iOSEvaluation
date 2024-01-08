// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Coordinator",
            targets: ["Coordinator"]),
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]),
        .library(
            name: "Extensions",
            targets: ["Extensions"]),
        .library(
          name: "Networking",
          targets: ["Networking"])
    ],
    targets: [
        .target(
            name: "Coordinator",
            dependencies: []),
        .target(
            name: "DesignSystem",
            dependencies: []),
        .target(
            name: "Extensions",
            dependencies: []),
        .target(
          name: "Networking",
          dependencies: []),
        .testTarget(name: "NetworkingTests",
                    dependencies: ["Networking"])
    ]
)
