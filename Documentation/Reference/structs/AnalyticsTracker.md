**STRUCT**

# `AnalyticsTracker`

```swift
public struct AnalyticsTracker: AnalyticsTrackerProtocol
```

## Methods
### `track(error:isFatal:)`

```swift
public func track(error: Error, isFatal: Bool)
```

### `track(event:)`

```swift
public func track(event: AnalyticsEventProtocol)
```

### `track(time:withCategory:withVariable:withLabel:)`

```swift
public func track(
  time: TimeInterval,
  withCategory category: String,
  withVariable variable: String,
  withLabel label: String?
)
```
