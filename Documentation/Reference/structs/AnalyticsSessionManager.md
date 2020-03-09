**STRUCT**

# `AnalyticsSessionManager`

```swift
public struct AnalyticsSessionManager<SessionType: Session>: AnalyticsSessionManagerProtocol
```

## Properties
### `session`

```swift
public let session: SessionType
```

### `requestBuilder`

```swift
public let requestBuilder: AnalyticsRequestBuilderProtocol
```

## Methods
### `init(session:requestBuilder:)`

```swift
public init(session: SessionType, requestBuilder: AnalyticsRequestBuilderProtocol? = nil)
```

### `send(_:_:)`

```swift
public func send(_ parameters: AnalyticsParameterDictionary, _ callback: @escaping ((Error?) -> Void))
```
