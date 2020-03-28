**CLASS**

# `AnalyticsHitParserMessage`

```swift
public class AnalyticsHitParserMessage: Codable, Equatable
```

## Properties
### `messageType`

```swift
public let messageType: AnalyticsHitParserMessageType
```

### `description`

```swift
public let description: String
```

### `messageCode`

```swift
public let messageCode: String?
```

### `parameter`

```swift
public let parameter: String?
```

## Methods
### `==(_:_:)`

```swift
public static func == (lhs: AnalyticsHitParserMessage, rhs: AnalyticsHitParserMessage) -> Bool
```

#### Parameters

| Name | Description |
| ---- | ----------- |
| lhs | A value to compare. |
| rhs | Another value to compare. |

### `init(messageType:description:messageCode:parameter:)`

```swift
public init(messageType: AnalyticsHitParserMessageType, description: String, messageCode: String? = nil, parameter: String? = nil)
```
