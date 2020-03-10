**STRUCT**

# `AnalyticsRequestBuilder`

```swift
public struct AnalyticsRequestBuilder: AnalyticsRequestBuilderProtocol
```

> Builds a analytics request based on the session.

## Properties
### `parameterEncoder`

```swift
public let parameterEncoder: AnalyticsParameterEncoderProtocol
```

> The parameter encoder.

## Methods
### `init(parameterEncoder:)`

```swift
public init(
  parameterEncoder: AnalyticsParameterEncoderProtocol? = nil
)
```

> Creates the request builder based on the parameter encoder.
>  - Parameter parameterEncoder: Encodes the parameters for the request.

#### Parameters

| Name | Description |
| ---- | ----------- |
| parameterEncoder | Encodes the parameters for the request. |

### `request(forSession:withParameters:)`

```swift
public func request<SessionType, RequestType>(
  forSession session: SessionType,
  withParameters parameters: AnalyticsParameterDictionary
) throws -> RequestType where SessionType: Session, RequestType == SessionType.RequestType
```

> Builds a analytics request based on the session and parameters.
>
> - Parameter session: The session to build the request for.
> - Parameter parameters: A dictionary of parameters for the analytics request.

#### Parameters

| Name | Description |
| ---- | ----------- |
| session | The session to build the request for. |
| parameters | A dictionary of parameters for the analytics request. |