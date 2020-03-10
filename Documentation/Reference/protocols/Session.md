**PROTOCOL**

# `Session`

```swift
public protocol Session
```

> Session used for making and sending requests.

## Methods
### `request()`

```swift
func request() -> RequestType
```

> Creates the URLRequest.

### `begin(request:_:)`

```swift
func begin(request: RequestType, _ completion: @escaping ((AnalyticsResult) -> Void))
```

> Makes the request.
> - Parameters:
>   - request: The URLRequest
>   - completion: Callback to call when the request is finished.

#### Parameters

| Name | Description |
| ---- | ----------- |
| request | The URLRequest |
| completion | Callback to call when the request is finished. |