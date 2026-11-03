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
            url: "https://github.com/Sonar-Health/sonar-ios-sdk/releases/download/0.1.7/SonarSDK.xcframework.zip",
            checksum: "df130a84f06ea6196add64c52b0045dfe254bf81fd533fa4f53dd3a51633d89f"
        ),
    ]
)
