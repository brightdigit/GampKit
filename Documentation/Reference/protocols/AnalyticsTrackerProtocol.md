**PROTOCOL**

# `AnalyticsTrackerProtocol`

```swift
public protocol AnalyticsTrackerProtocol
```

## Methods
### `track(time:withCategory:withVariable:withLabel:)`

```swift
func track(time: TimeInterval, withCategory category: String, withVariable variable: String, withLabel label: String?)
```

### `track(event:)`

```swift
func track(event: AnalyticsEventProtocol)
```

### `track(error:isFatal:)`

```swift
func track(error: Error, isFatal: Bool)
```
