**PROTOCOL**

# `AnalyticsTrackerProtocol`

```swift
public protocol AnalyticsTrackerProtocol
```

## Methods
### `track(time:withCategory:withVariable:withLabel:_:)`

```swift
func track(
```

### `track(event:_:)`

```swift
func track(event: AnalyticsEventProtocol, _ callback: @escaping ((Error?) -> Void))
```

### `track(error:isFatal:_:)`

```swift
func track(error: Error, isFatal: Bool, _ callback: @escaping ((Error?) -> Void))
```
