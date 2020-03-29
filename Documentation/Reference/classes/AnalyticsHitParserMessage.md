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

> Type of message.

### `description`

```swift
public let description: String
```

> Additional details or steps to fix the validation issue.

### `messageCode`

```swift
public let messageCode: String?
```

> The message code of the issue.

### `parameter`

```swift
public let parameter: String?
```

> The parameter (if applicable) causing the validation issue.

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
