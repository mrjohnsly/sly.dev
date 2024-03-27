// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Server",
    platforms: [.macOS(.v14)],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
        .package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "2.0.0-alpha.1"),
    ],
    targets: [
        .executableTarget(
            name: "Server",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Hummingbird", package: "hummingbird"),
            ]
        ),
        .testTarget(
            name: "ServerTests",
            dependencies: [
                "Server",
                .product(name: "Hummingbird", package: "hummingbird"),
                .product(name: "HummingbirdTesting", package: "hummingbird"),
            ]
        )
    ]
)
