**EXTENSION**

# `AnalyticsTrackerProtocol`

## Methods
### `track(error:isFatal:_:)`

```swift
public func track(error: Error, isFatal: Bool = false, _ callback: @escaping ((AnalyticsResult) -> Void))
```

> Tracks the trackable the error.
> - Parameter error: The trackable error.
> - Parameter isFatal: Whether the error is fatal.
> - Parameter callback: What to call on completion.

#### Parameters

| Name | Description |
| ---- | ----------- |
| error | The trackable error. |
| isFatal | Whether the error is fatal. |
| callback | What to call on completion. |

### `track(time:withCategory:withVariable:withLabel:_:)`

```swift
public func track(
  time: TimeInterval,
  withCategory category: String,
  withVariable variable: String,
  withLabel label: String?,
  _ callback: @escaping ((AnalyticsResult) -> Void)
)
```

> Tracks the timed event.
> - Parameters:
>   - time: The timing to track.
>   - category: The timing category.
>   - variable: The timing variable.
>   - label: The timing label.
>   - callback: What to call on completion.

#### Parameters

| Name | Description |
| ---- | ----------- |
| time | The timing to track. |
| category | The timing category. |
| variable | The timing variable. |
| label | The timing label. |
| callback | What to call on completion. |