**STRUCT**

# `AnalyticsConfiguration`

```swift
public struct AnalyticsConfiguration: AnalyticsConfigurationProtocol
```

> Static configuration to use for tracking the application.

## Properties
### `version`

```swift
public let version = 1
```

> Static version number. `1`

### `trackingIdentifier`

```swift
public let trackingIdentifier: String
```

> Tracking identifier for Google Analytics.

### `clientIdentifier`

```swift
public let clientIdentifier: String
```

> Anonymous client identifier for Google Analytics.

### `applicationName`

```swift
public let applicationName: String
```

> Application name.

### `applicationVersion`

```swift
public let applicationVersion: String
```

> Application version.

### `userLanguage`

```swift
public let userLanguage: String?
```

> (Optional) User language.

### `customParameters`

```swift
public let customParameters: AnalyticsParameterDictionary
```

> (Optional) Custom parameters to attach to all tracking info.

## Methods
### `init(trackingIdentifier:applicationName:applicationVersion:clientIdentifier:customParameters:userLanguage:)`

```swift
public init(
  trackingIdentifier: String,
  applicationName: String,
  applicationVersion: String,
  clientIdentifier: String,
  customParameters: AnalyticsParameterDictionary? = nil,
  userLanguage: String? = nil
)
```

> Creates the URL Session to use for analytics.
> - Parameters:
>   - trackingIdentifier: Tracking identifier for Google Analytics.
>   - applicationName: Application name.
>   - applicationVersion: Application version.
>   - clientIdentifier: Anonymous client identifier for Google Analytics.
>   - customParameters: (Optional) Custom parameters to attach to all tracking info.
>   - userLanguage: (Optional) User language. Uses first preferred locale, if not set.

#### Parameters

| Name | Description |
| ---- | ----------- |
| trackingIdentifier | Tracking identifier for Google Analytics. |
| applicationName | Application name. |
| applicationVersion | Application version. |
| clientIdentifier | Anonymous client identifier for Google Analytics. |
| customParameters | (Optional) Custom parameters to attach to all tracking info. |
| userLanguage | (Optional) User language. Uses first preferred locale, if not set. |