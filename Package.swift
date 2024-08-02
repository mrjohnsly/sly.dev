// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SlyDevServer",
    platforms: [.macOS(.v14)],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
        .package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "2.0.0-rc.3"),
        .package(url: "https://github.com/hummingbird-project/swift-mustache.git", from: "2.0.0-beta.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "SlyDevServer",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Hummingbird", package: "hummingbird"),
                .product(name: "Mustache", package: "swift-mustache"),
            ]
        ),
        .testTarget(
            name: "SlyDevServerTests",
            dependencies: [
                "SlyDevServer",
                .product(name: "Hummingbird", package: "hummingbird"),
                .product(name: "HummingbirdTesting", package: "hummingbird"),
            ]
        )
    ]
)
