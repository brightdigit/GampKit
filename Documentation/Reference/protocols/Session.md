**PROTOCOL**

# `Session`

```swift
public protocol Session
```

## Methods
### `request(withURL:cachePolicy:timeoutInterval:)`

```swift
func request(withURL url: URL, cachePolicy: CachePolicy, timeoutInterval: TimeInterval) -> RequestType
```

### `begin(request:_:)`

```swift
func begin(request: RequestType, _ completion: @escaping ((Error?) -> Void))
```
