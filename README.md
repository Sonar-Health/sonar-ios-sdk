# Sonar iOS SDK

Syncs Apple Health data to Sonar for your signed-in users. The SDK reads HealthKit, uploads in the
background, and keeps its place; your backend reads the normalized data from the Sonar API.

- iOS 16 or later, Xcode 26 or later
- Beta: the API can still change before 1.0
- Guide: https://docs.sonarhealth.co/ios-sdk/
- Examples (Swift, React Native, a demo backend): https://github.com/Sonar-Health/sonar-sdk-examples

## Before you start

- An SDK app ID: add your bundle ID in Atlas → Developers → Apps.
- A Sonar API key, kept on your backend. Sandbox or live follows the key; the app is built the same
  for both.
- A Sonar user for each of your users (`POST /v1/users`).

## Install

Swift Package Manager: add `https://github.com/Sonar-Health/sonar-ios-sdk.git`, version `0.1.0` or
newer, and the `SonarSDK` product to your app target.

CocoaPods:

```ruby
pod 'SonarSDK', '~> 0.1.0'
```

## Set up the app target

- Capabilities: HealthKit, with Background Delivery; Background Modes: Background fetch and
  Background processing.
- `Info.plist`:

```xml
<key>NSHealthShareUsageDescription</key>
<string>Explain why your app reads health data.</string>
<key>BGTaskSchedulerPermittedIdentifiers</key>
<array>
    <string>co.sonarhealth.sdk.refresh</string>
    <string>co.sonarhealth.sdk.backfill</string>
</array>
```

## Use

Configure in `application(_:didFinishLaunchingWithOptions:)` on every launch: iOS only keeps
background tasks and HealthKit observers registered before launch finishes.

```swift
import SonarSDK

func application(_ application: UIApplication, didFinishLaunchingWithOptions options: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    try? Sonar.configure(appId: "app_…")
    return true
}
```

Once your user is signed in, on every launch:

```swift
try await Sonar.authenticate { context in
    // Your backend calls POST /v1/users/{id}/sdk-sessions with its API key and returns client_token.
    try await myBackend.sonarClientToken(installationId: context.installationId)
}

let observation = Sonar.observeState { state in render(state) }
try await Sonar.connect(.appleHealth)
```

After `connect`, the SDK syncs on its own: in the foreground, when HealthKit reports changes, and in
background tasks. The first sync brings recent data first, then up to two years of history.

| Call | What it does |
| --- | --- |
| `sync()` | Sends new data now |
| `resync(.appleHealth)` | Sends everything again |
| `disconnect(.appleHealth)` | Stops syncing and deletes this provider's data in Sonar |
| `signOut()` | Ends the Sonar session on this phone; the connection stays for the user |
| `sendDiagnostics()` | Sends the SDK log to Sonar for a support request |

The app never holds a Sonar API key.

## Privacy

The framework ships a privacy manifest (health, fitness and diagnostic data, used for app
functionality, not for tracking). Declare the same in your App Store privacy answers.

## License

See [LICENSE](LICENSE).
