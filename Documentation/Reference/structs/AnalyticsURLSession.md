**STRUCT**

# `AnalyticsURLSession`

```swift
public struct AnalyticsURLSession: Session
```

## Properties
### `url`

```swift
public let url: URL
```

> Base URL for the request.

### `cachePolicy`

```swift
public let cachePolicy: URLRequest.CachePolicy
```

> Cache policy for URLRequest.

### `session`

```swift
public let session: URLSessionable
```

> URL Session.

### `timeoutInterval`

```swift
public let timeoutInterval: TimeInterval
```

> Timeout for URLRequest.

## Methods
### `init(url:cachePolicy:session:timeoutInterval:)`

```swift
public init(url: URL? = nil,
            cachePolicy: URLRequest.CachePolicy? = nil,
            session: URLSessionable? = nil,
            timeoutInterval: TimeInterval? = nil)
```

> Creates the URL Session to use for analytics.
> - Parameters:
>   - url: Optional URL for analytics URL
>   - cachePolicy: Cache policy for URLRequest.
>   - timeoutInterval: Timeout for URLRequest.
>   - session: URL Session for URLRequest.

#### Parameters

| Name | Description |
| ---- | ----------- |
| url | Optional URL for analytics URL |
| cachePolicy | Cache policy for URLRequest. |
| timeoutInterval | Timeout for URLRequest. |
| session | URL Session for URLRequest. |

### `request()`

```swift
public func request() -> URLRequest
```

> Creates the URLRequest.

### `begin(request:_:)`

```swift
public func begin(request: URLRequest, _ completion: @escaping ((AnalyticsResult) -> Void))
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