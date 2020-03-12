**PROTOCOL**

# `AnalyticsExceptionProtocol`

```swift
public protocol AnalyticsExceptionProtocol: AnalyticsTrackable
```

> Trackable exception hit for Google Analytics.

## Properties
### `error`

```swift
var error: Error
```

> Source error to track.

### `isFatal`

```swift
var isFatal: Bool
```

> Whether the error is fatal
