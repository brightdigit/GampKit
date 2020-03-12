**STRUCT**

# `AnalyticsEvent`

```swift
public struct AnalyticsEvent: AnalyticsEventProtocol
```

> Trackable analytics event.

## Properties
### `category`

```swift
public let category: String
```

> The event category.

### `action`

```swift
public let action: String
```

> The event action.

### `label`

```swift
public let label: String?
```

> The event label.

### `value`

```swift
public let value: Int?
```

> The event value.

## Methods
### `init(category:action:label:value:)`

```swift
public init(
  category: String,
  action: String,
  label: String? = nil,
  value: Int? = nil
)
```

> Tracks the timed event.
> - Parameters:
>   - category: The event category.
>   - action: The event action.
>   - label: The event label.
>   - value: (Optional) The event value.

#### Parameters

| Name | Description |
| ---- | ----------- |
| category | The event category. |
| action | The event action. |
| label | The event label. |
| value | (Optional) The event value. |