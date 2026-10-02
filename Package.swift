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
            url: "https://github.com/Sonar-Health/sonar-ios-sdk/releases/download/0.1.5/SonarSDK.xcframework.zip",
            checksum: "71f550851e8e5bc51038861d95a019e80f433bb236e31cef132a7fd5e46e1a46"
        ),
    ]
)
