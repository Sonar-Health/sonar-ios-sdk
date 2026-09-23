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
            url: "https://github.com/Sonar-Health/sonar-ios-sdk/releases/download/0.1.1/SonarSDK.xcframework.zip",
            checksum: "36f0ebbccd9c88562f7eac5dc7a61119142111ef9cc31822926879002d3b890d"
        ),
    ]
)
