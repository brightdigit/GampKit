**STRUCT**

# `AnalyticsRequestBuilder`

```swift
public struct AnalyticsRequestBuilder: AnalyticsRequestBuilderProtocol
```

## Properties
### `baseURL`

```swift
public let baseURL: URL
```

### `cachePolicy`

```swift
public let cachePolicy: CachePolicy
```

### `parameterEncoder`

```swift
public let parameterEncoder: AnalyticsParameterEncoderProtocol
```

### `timeoutInterval`

```swift
public let timeoutInterval: TimeInterval
```

## Methods
### `init(baseURL:cachePolicy:parameterEncoder:timeoutInterval:)`

```swift
public init(
  baseURL: URL? = nil,
  cachePolicy: CachePolicy = .useProtocolCachePolicy,
  parameterEncoder: AnalyticsParameterEncoderProtocol? = nil,
  timeoutInterval: TimeInterval = 5.0
)
```

### `request(forSession:withParameters:)`

```swift
public func request<SessionType, RequestType>(
  forSession session: SessionType,
  withParameters parameters: AnalyticsParameterDictionary
) -> RequestType where SessionType: Session, RequestType == SessionType.RequestType
```
