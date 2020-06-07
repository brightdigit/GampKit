**PROTOCOL**

# `AnalyticsRequestBuilderProtocol`

```swift
public protocol AnalyticsRequestBuilderProtocol
```

> Builds a analytics request based on the session.

## Methods
### `request(forSession:withParameters:)`

```swift
func request<SessionType: Session, RequestType>(
  forSession session: SessionType,
  withParameters parameters: AnalyticsParameterDictionary
) throws -> RequestType where SessionType.RequestType == RequestType
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