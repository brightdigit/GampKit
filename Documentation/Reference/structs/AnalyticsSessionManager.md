**STRUCT**

# `AnalyticsSessionManager`

```swift
public struct AnalyticsSessionManager: AnalyticsSessionManagerProtocol
```

## Properties
### `baseUrl`

```swift
public let baseUrl: URL
```

### `timeoutInterval`

```swift
public let timeoutInterval: TimeInterval = 5
```

### `session`

```swift
public let session: URLSession
```

## Methods
### `createSession(withDelegate:inQueue:withUserAgent:)`

```swift
public static func createSession(
  withDelegate delegate: URLSessionDelegate? = nil,
  inQueue queue: OperationQueue? = nil,
  withUserAgent userAgent: String? = nil
) -> URLSession
```

### `init(baseUrl:)`

```swift
public init(baseUrl: URL? = nil)
```

### `send(_:)`

```swift
public func send(_ parameters: AnalyticsParameterDictionary)
```
