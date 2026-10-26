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
            url: "https://github.com/Sonar-Health/sonar-ios-sdk/releases/download/0.1.6/SonarSDK.xcframework.zip",
            checksum: "734c97ee4e828516d3a7ba557bb35590bd6c0acf7af0461c5a6eb4e1ca909661"
        ),
    ]
)
