// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MSBAccountsJourney",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MSBAccountsJourney",
            targets: ["MSBAccountsJourney"]),
    ],
    dependencies: [
        .package(path: "../MSBCore"),
        .package(path: "../MSBCoreUI"),
        .package(path: "../MSBPublicLibs/Resolver"),
        .package(url: "https://github.com/CombineCommunity/CombineCocoa.git", from: "0.2.1"),
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MSBAccountsJourney",
            dependencies: [
                "MSBCore",
                .product(name: "MSBCoreUI", package: "MSBCoreUI"),
                .product(name: "MSBPreferences", package: "MSBCore"),
                .product(name: "MSBNetworking", package: "MSBCore"),
                .product(name: "MSBDeeplink", package: "MSBCore"),
                .product(name: "MSBFoundation", package: "MSBCore"),
                "Resolver",
                "CombineCocoa",
                "Moya"

            ]
        ),
        .testTarget(
            name: "MSBAccountsJourneyTests",
            dependencies: [
                "MSBAccountsJourney"
            ]
        ),
    ]
)
