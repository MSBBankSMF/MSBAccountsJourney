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
        .package(path: "../../MSBCore"),
        .package(path: "../../PublicLib/SnapKit"),
        .package(path: "../../PublicLib/RxCocoa"),
        .package(path: "../../PublicLib/Resolver"),
//        .package(url: "https://github.com/hmlongco/Resolver.git", from: "1.5.1"),
//        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
//        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "14.0.1")),
//        .package(url: "https://github.com/quickbirdstudios/XCoordinator.git", .upToNextMajor(from: "2.2.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MSBAccountsJourney",
            dependencies: [
                "MSBCore",
                .product(name: "MSBCoreUI", package: "MSBCore"),
                .product(name: "MSBPreferences", package: "MSBCore"),
                .product(name: "MSBNetworking", package: "MSBCore"),
                .product(name: "MSBDeeplink", package: "MSBCore"),
                "SnapKit",
                "RxCocoa",
                "Resolver"
//                "Moya",
//                "XCoordinator"
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
