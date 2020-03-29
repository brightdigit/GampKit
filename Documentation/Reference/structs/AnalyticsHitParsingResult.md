**STRUCT**

# `AnalyticsHitParsingResult`

```swift
public struct AnalyticsHitParsingResult: Codable, Equatable
```

> Result from a hit sent in the original request.

## Properties
### `valid`

```swift
public let valid: Bool
```

> True for valid hits, false for invalid hits.

### `hit`

```swift
public let hit: String
```

> A string containing the path of the request as well as its method and protocol.

### `parserMessage`

```swift
public let parserMessage: [AnalyticsHitParserMessage]
```

> A list of parser messages. If the hit is valid, this array will be empty.

## Methods
### `init(valid:hit:parserMessage:)`

```swift
public init(valid: Bool, hit: String, parserMessage: [AnalyticsHitParserMessage])
```
