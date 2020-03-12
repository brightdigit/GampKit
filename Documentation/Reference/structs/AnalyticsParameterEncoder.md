**STRUCT**

# `AnalyticsParameterEncoder`

```swift
public struct AnalyticsParameterEncoder: AnalyticsParameterEncoderProtocol
```

> Encodes the parameters for use by the analytics tracker.

## Methods
### `encode(parameters:)`

```swift
public func encode(parameters: AnalyticsParameterDictionary) throws -> Data
```

> Encodes the parameters for use by the analytics tracker.
>
> - Parameter parameters: the dictionary of values to encode
> - Returns: Encoded data
> - Throws:
>      - `StringEncodingError`
>          if the encoded string can not be converted to `Data`.

#### Parameters

| Name | Description |
| ---- | ----------- |
| parameters | the dictionary of values to encode |