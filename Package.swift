// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SonarSDK",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "SonarSDK", targets: ["SonarSDK"]),
    ],
    targets: [
        .binaryTarget(
            name: "SonarSDK",
            url: "https://github.com/Sonar-Health/sonar-ios-sdk/releases/download/0.1.8/SonarSDK.xcframework.zip",
            checksum: "28db4d1591743be185bb0a44935d1b11ebc36098416df4367e70849c3c98f0a7"
        ),
    ]
)
