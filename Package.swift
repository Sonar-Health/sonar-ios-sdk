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
            url: "https://github.com/Sonar-Health/sonar-ios-sdk/releases/download/0.1.4/SonarSDK.xcframework.zip",
            checksum: "8389219eee06f14330ce1eec81bb59123a70c35d06cd1ed789cc5fdf9af9177b"
        ),
    ]
)
