// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WeatherTrackerGateway",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "WeatherTrackerGateway",
            targets: ["WeatherTrackerGateway"]),
    ],
    
    dependencies: [
        .package(url: "https://github.com/rezojoglidze/RJSwiftMacros", .upToNextMajor(from: "0.4.5"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "WeatherTrackerGateway",
            dependencies: [
                .product(name: "RJSwiftMacros", package: "RJSwiftMacros")
            ]
            
        )
    ]
)
