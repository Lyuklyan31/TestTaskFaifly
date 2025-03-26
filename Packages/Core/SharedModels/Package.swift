// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SharedModels",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "SharedModels", targets: ["SharedModels"]),
    ],
    dependencies: [
        .package(name: "Shared", path: "../Shared")
    ],
    targets: [
        .target(name: "SharedModels", dependencies: ["Shared"])
    ]
)
