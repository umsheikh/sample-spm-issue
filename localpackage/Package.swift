// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "localpackage",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "localpackage",
            targets: ["localpackage"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Datadog/dd-sdk-ios", from: "1.0.0"),
        .package(url: "https://github.com/ArtSabintsev/siren", from: "6.0.0"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "0.39.0"),
        .package(url: "https://github.com/apple/swift-collections", from: "1.0.2"),
        .package(url: "https://github.com/pointfreeco/swiftui-navigation", from: "0.2.0"),
        .package(url: "https://github.com/AzureAD/microsoft-authentication-library-for-objc.git", from: "1.1.14"),
        .package(url: "https://github.com/microsoft/appcenter-sdk-apple.git", from: "4.1.0"),
        .package(url: "https://github.com/datatheorem/TrustKit", from: "1.7.0"),
    ],
    targets: [
        .target(
            name: "localpackage",
            dependencies: [
                .product(name: "DatadogStatic", package: "dd-sdk-ios"),
                .product(name: "AppCenterAnalytics", package: "appcenter-sdk-apple"),
                .product(name: "AppCenterCrashes", package: "appcenter-sdk-apple"),
                .product(name: "MSAL", package: "microsoft-authentication-library-for-objc"),
                .product(name: "Siren", package: "siren"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "SwiftUINavigation", package: "swiftui-navigation"),
                .product(name: "TrustKit", package: "trustkit"),
            ],
            cSettings: [
                .define("SWIFT_INSTALL_OBJC_HEADER", to: "NO")
            ]
        ),
        .testTarget(
            name: "localpackageTests",
            dependencies: ["localpackage"]),
    ]
)
