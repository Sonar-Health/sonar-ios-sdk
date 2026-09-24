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
            url: "https://github.com/Sonar-Health/sonar-ios-sdk/releases/download/0.1.2/SonarSDK.xcframework.zip",
            checksum: "325b74a7c245a44ce50feef77366980a6a471a65133dab9e0d0a84eb92a91653"
        ),
    ]
)
