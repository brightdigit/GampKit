**PROTOCOL**

# `AnalyticsParameterEncoderProtocol`

```swift
public protocol AnalyticsParameterEncoderProtocol
```

> Encodes the parameters for use by the analytics tracker.

## Methods
### `encode(parameters:)`

```swift
func encode(parameters: AnalyticsParameterDictionary) throws -> Data
```

> Encodes the parameters for use by the analytics tracker.
>
> - Parameter parameters: the dictionary of values to encode
> - Returns: Data, if can be encoded

#### Parameters

| Name | Description |
| ---- | ----------- |
| parameters | the dictionary of values to encode |