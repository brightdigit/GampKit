**STRUCT**

# `AnalyticsValidation`

```swift
public struct AnalyticsValidation: Codable, Equatable
```

> The response from validation call.

## Properties
### `hitParsingResult`

```swift
public let hitParsingResult: [AnalyticsHitParsingResult]
```

> An array which represents the hits sent in the original request.

## Methods
### `init(hitParsingResult:)`

```swift
public init(hitParsingResult: [AnalyticsHitParsingResult])
```

> Create the response from validation call.
