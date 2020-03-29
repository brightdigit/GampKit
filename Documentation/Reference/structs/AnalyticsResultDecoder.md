**STRUCT**

# `AnalyticsResultDecoder`

```swift
public struct AnalyticsResultDecoder: AnalyticsResultDecoderProtocol
```

> Decodes the data from the `URLSession`data task into an `AnalyticsResult`.

## Methods
### `init()`

```swift
public init()
```

### `decode(_:)`

```swift
public func decode(_ data: Data) -> AnalyticsResult
```

>  Decodes the data from `URLSession` into an `AnalyticsResult`.
> - Parameter data: The `URLSession` data task.

#### Parameters

| Name | Description |
| ---- | ----------- |
| data | The `URLSession` data task. |