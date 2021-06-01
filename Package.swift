// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Sly",
    products: [
        .executable(
            name: "Sly",
            targets: ["Sly"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.7.0")
    ],
    targets: [
        .target(
            name: "Sly",
            dependencies: ["Publish"]
        )
    ]
)