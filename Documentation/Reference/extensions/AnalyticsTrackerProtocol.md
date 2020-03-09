**EXTENSION**

# `AnalyticsTrackerProtocol`

## Methods
### `track(error:isFatal:_:)`

```swift
public func track(error: Error, isFatal: Bool = false, _ callback: @escaping ((Error?) -> Void))
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
