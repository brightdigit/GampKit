**STRUCT**

# `AnalyticsEvent`

```swift
public struct AnalyticsEvent: AnalyticsEventProtocol
```

## Properties
### `category`

```swift
public let category: String
```

### `action`

```swift
public let action: String
```

### `label`

```swift
public let label: String?
```

### `value`

```swift
public let value: Int?
```

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
