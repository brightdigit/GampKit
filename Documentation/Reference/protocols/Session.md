**PROTOCOL**

# `Session`

```swift
public protocol Session
```

## Methods
### `request()`

```swift
func request() -> RequestType
```

### `begin(request:_:)`

```swift
func begin(request: RequestType, _ completion: @escaping ((Error?) -> Void))
```
