**EXTENSION**

# `URLSession`
```swift
extension URLSession: URLSessionable
```

## Methods
### `dataTask(with:decodeWith:_:)`

```swift
public func dataTask(with request: URLRequest,
                     decodeWith decoder: AnalyticsResultDecoderProtocol,
                     _ completion: @escaping (AnalyticsResult) -> Void) -> URLSessionableDataTask
```

#### Parameters

| Name | Description |
| ---- | ----------- |
| request | The URLRequest. |
| completion | What to call when the call is completed. |