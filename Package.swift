// swift-tools-version: 5.9

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "나의 앱",
    platforms: [
        .iOS("17.5")
    ],
    products: [
        .iOSApplication(
            name: "나의 앱",
            targets: ["AppModule"],
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .camera),
            accentColor: .presetColor(.teal),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/twostraws/Subsonic", "0.2.0"..<"1.0.0")
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            dependencies: [
                .product(name: "Subsonic", package: "subsonic")
            ],
            path: ".",
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals")
            ]
        )
    ]
)