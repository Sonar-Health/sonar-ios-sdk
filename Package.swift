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
            url: "https://github.com/Sonar-Health/sonar-ios-sdk/releases/download/0.1.3/SonarSDK.xcframework.zip",
            checksum: "4c173024d02fc0dc359d68d63120ad43e1dac0f09248191c80cdd75e40689ea6"
        ),
    ]
)
