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
            url: "https://github.com/Sonar-Health/sonar-ios-sdk/releases/download/0.1.0/SonarSDK.xcframework.zip",
            checksum: "fa842524ae4c33017400fc0d293d7ec8ab5745ae6888c2a1288fa4a58c1858ff"
        ),
    ]
)
