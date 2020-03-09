**EXTENSION**

# `AnalyticsTrackerProtocol`

## Methods
### `trackError(_:isFatal:_:)`

```swift
public func trackError(_ error: Error, isFatal: Bool = false, _ callback: @escaping ((Error?) -> Void))
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
