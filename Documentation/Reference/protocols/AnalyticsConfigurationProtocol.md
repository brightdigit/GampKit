**PROTOCOL**

# `AnalyticsConfigurationProtocol`

```swift
public protocol AnalyticsConfigurationProtocol: AnalyticsParameterable
```

> Static configuration to use for tracking the application.

## Properties
### `applicationVersion`

```swift
var applicationVersion: String
```

> Application version.

### `applicationName`

```swift
var applicationName: String
```

> Application name.

### `trackingIdentifier`

```swift
var trackingIdentifier: String
```

> Tracking identifier for Google Analytics.

### `clientIdentifier`

```swift
var clientIdentifier: UUID
```

> Anonymous client identifier for Google Analytics.

### `version`

```swift
var version: Int
```

> Static version number. `1`

### `userLanguage`

```swift
var userLanguage: String?
```

> (Optional) User language.

### `customParameters`

```swift
var customParameters: AnalyticsParameterDictionary
```

> (Optional) Custom parameters to attach to all tracking info.
