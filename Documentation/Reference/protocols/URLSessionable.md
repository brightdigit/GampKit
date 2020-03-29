**PROTOCOL**

# `URLSessionable`

```swift
public protocol URLSessionable
```

> Abstraction for making URLRequests.

## Methods
### `dataTask(with:decodeWith:_:)`

```swift
func dataTask(with request: URLRequest,
```

> Creates the URLRequestDataTask and calls resume.
> - Parameter request: The URLRequest.
> - Parameter completion: What to call when the call is completed.
> - Returns: The URLSession Task.

#### Parameters

| Name | Description |
| ---- | ----------- |
| request | The URLRequest. |
| completion | What to call when the call is completed. |