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
### `request()`

```swift
public func request() -> URLRequest
```

### `begin(request:_:)`

```swift
public func begin(request: URLRequest, _ completion: @escaping ((Error?) -> Void))
```
