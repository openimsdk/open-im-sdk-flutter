// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "flutter_openim_sdk",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "flutter-openim-sdk", targets: ["flutter_openim_sdk"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        .package(url: "https://github.com/openimsdk/openim-sdk-core-ios.git", exact: "3.8.3-hotfix.15")
    ],
    targets: [
        .target(
            name: "flutter_openim_sdk",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "OpenIMCore", package: "openim-sdk-core-ios")
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ],
            linkerSettings: [
                .linkedLibrary("resolv")
            ]
        )
    ]
)
