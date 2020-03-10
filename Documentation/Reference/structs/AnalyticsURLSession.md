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

### `session`

```swift
public let session: URLSessionable
```

### `timeoutInterval`

```swift
public let timeoutInterval: TimeInterval
```

## Methods
### `init(url:cachePolicy:session:timeoutInterval:)`

```swift
public init(url: URL? = nil,
            cachePolicy: URLRequest.CachePolicy? = nil,
            session: URLSessionable? = nil,
            timeoutInterval: TimeInterval? = nil)
```

### `request()`

```swift
public func request() -> URLRequest
```

### `begin(request:_:)`

```swift
public func begin(request: URLRequest, _ completion: @escaping ((Error?) -> Void))
```
