**STRUCT**

# `AnalyticsConfiguration`

```swift
public struct AnalyticsConfiguration: AnalyticsConfigurationProtocol
```

## Properties
### `version`

```swift
public let version = 1
```

### `trackingIdentifier`

```swift
public let trackingIdentifier: String
```

### `clientIdentifier`

```swift
public let clientIdentifier: String
```

### `applicationName`

```swift
public let applicationName: String
```

### `applicationVersion`

```swift
public let applicationVersion: String
```

### `userLanguage`

```swift
public let userLanguage: String?
```

### `customParameters`

```swift
public let customParameters: AnalyticsParameterDictionary
```

## Methods
### `init(trackingIdentifier:applicationName:applicationVersion:customParameters:clientIdentifierDelegate:userLanguage:)`

```swift
public init(
  trackingIdentifier: String,
  applicationName: String,
  applicationVersion: String,
  customParameters: AnalyticsParameterDictionary? = nil,
  clientIdentifierDelegate: ClientIdentifierProtocol? = nil,
  userLanguage: String? = nil
)
```
