**STRUCT**

# `AnalyticsTracker`

```swift
public struct AnalyticsTracker: AnalyticsTrackerProtocol
```

## Methods
### `track(error:isFatal:_:)`

```swift
public func track(error: Error, isFatal: Bool, _ callback: @escaping ((Error?) -> Void))
```

### `track(event:_:)`

```swift
public func track(event: AnalyticsEventProtocol, _ callback: @escaping ((Error?) -> Void))
```

### `track(time:withCategory:withVariable:withLabel:_:)`

```swift
public func track(
  time: TimeInterval,
  withCategory category: String,
  withVariable variable: String,
  withLabel label: String?,
  _ callback: @escaping ((Error?) -> Void)
)
```
