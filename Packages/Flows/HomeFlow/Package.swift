// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HomeFlow",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "HomeFlow",
            targets: ["HomeFlow"]),
    ],
    dependencies: [
        .package(name: "Shared", path: "../../Core/Shared"),
        .package(name: "UIComponents", path: "../../Components/UIComponents"),
        .package(name: "PeopleClient", path: "../../Clients/PeopleClient"),
        .package(name: "Extensions", path: "../../Core/Extensions")
        ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "HomeFlow",
            dependencies: [
                .product(name: "Shared", package: "Shared"),
                .product(name: "UIComponents", package: "UIComponents"),
                .product(name: "PeopleClient", package: "PeopleClient"),
                .product(name: "Extensions", package: "Extensions")
            ]
        ),
        .testTarget(
            name: "HomeFlowTests",
            dependencies: ["HomeFlow"]
        ),
    ]
)
