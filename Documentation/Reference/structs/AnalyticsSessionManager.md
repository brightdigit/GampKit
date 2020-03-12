**STRUCT**

# `AnalyticsSessionManager`

```swift
public struct AnalyticsSessionManager<SessionType: Session>: AnalyticsSessionManagerProtocol
```

> Manages the sending of parameters, session, and parameters.

## Properties
### `session`

```swift
public let session: SessionType
```

> The session to call and make requests from.

### `requestBuilder`

```swift
public let requestBuilder: AnalyticsRequestBuilderProtocol
```

> Builds requests based on the session.

## Methods
### `init(session:requestBuilder:)`

```swift
public init(session: SessionType, requestBuilder: AnalyticsRequestBuilderProtocol? = nil)
```

> Creates a session manager based on the session and request builder.
>  - Parameter session: The session for analytics.
>  - Parameter requestBuilder: Builds the request for the session.

#### Parameters

| Name | Description |
| ---- | ----------- |
| session | The session for analytics. |
| requestBuilder | Builds the request for the session. |

### `send(_:_:)`

```swift
public func send(_ parameters: AnalyticsParameterDictionary, _ callback: @escaping ((AnalyticsResult) -> Void))
```

>    Creates the request and sends the request based on the session.
> - Parameter parameters: The parameters to send.
> - Parameter callback: Callback to call on completion.

#### Parameters

| Name | Description |
| ---- | ----------- |
| parameters | The parameters to send. |
| callback | Callback to call on completion. |