**PROTOCOL**

# `AnalyticsTrackerProtocol`

```swift
public protocol AnalyticsTrackerProtocol
```

> Tracker for sending items to analytics.

## Methods
### `track(_:_:)`

```swift
func track(_ trackable: AnalyticsTrackable, _ callback: @escaping ((Error?) -> Void))
```

> Tracks the trackable item.
> - Parameter trackable: The trackable item.
> - Parameter callback: What to call on completion.

#### Parameters

| Name | Description |
| ---- | ----------- |
| trackable | The trackable item. |
| callback | What to call on completion. |