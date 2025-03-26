// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PeopleClient",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "PeopleClient",
            targets: ["PeopleClient"]
        ),
    ],
    dependencies: [
        .package(name: "Shared", path: "../../Core/Shared"),
        .package(name: "SharedModels", path: "../../Core/SharedModels"),
        .package(name: "NetworkClient", path: "../Clients/NetworkClient")
    ],
    targets: [
        .target(
            name: "PeopleClient",
            dependencies: [
                "Shared",
                "SharedModels",
                "NetworkClient"
            ]
        ),
        .testTarget(
            name: "PeopleClientTests",
            dependencies: ["PeopleClient"]
        ),
    ]
)
