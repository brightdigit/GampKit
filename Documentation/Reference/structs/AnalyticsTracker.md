**STRUCT**

# `AnalyticsTracker`

```swift
public struct AnalyticsTracker: AnalyticsTrackerProtocol
```

> Tracker for sending items to analytics.

## Methods
### `init(configuration:sessionManager:)`

```swift
public init(configuration: AnalyticsConfigurationProtocol, sessionManager: AnalyticsSessionManagerProtocol? = nil)
```

> Creates a tracker based on the configuration and session manager.
> - Parameter configuration: The static configuration for the tracker.
> - Parameter sessionManager: The session manager for sending data.

#### Parameters

| Name | Description |
| ---- | ----------- |
| configuration | The static configuration for the tracker. |
| sessionManager | The session manager for sending data. |

### `track(_:_:)`

```swift
public func track(_ trackable: AnalyticsTrackable, _ callback: @escaping ((Error?) -> Void))
```

> Tracks the trackable item.
> - Parameter trackable: The trackable item.
> - Parameter callback: What to call on completion.

#### Parameters

| Name | Description |
| ---- | ----------- |
| trackable | The trackable item. |
| callback | What to call on completion. |