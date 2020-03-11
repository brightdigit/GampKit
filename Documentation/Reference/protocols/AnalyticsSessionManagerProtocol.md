**PROTOCOL**

# `AnalyticsSessionManagerProtocol`

```swift
public protocol AnalyticsSessionManagerProtocol
```

> Manages the sending of parameters, session, and parameters.

## Methods
### `send(_:_:)`

```swift
func send(_ parameters: AnalyticsParameterDictionary, _ callback: @escaping ((AnalyticsResult) -> Void))
```

>    Creates the request and sends the request based on the session.
> - Parameter parameters: The parameters to send.
> - Parameter callback: Callback to call on completion.

#### Parameters

| Name | Description |
| ---- | ----------- |
| parameters | The parameters to send. |
| callback | Callback to call on completion. |