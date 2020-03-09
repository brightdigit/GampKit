import Foundation
import GampKit

struct MockSession: Session {
  let actualError: Error?
  func request(withURL url: URL, cachePolicy: CachePolicy, timeoutInterval: TimeInterval) -> MockRequest {
    return MockRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval, body: nil, method: nil, actualError: actualError)
  }

  func begin(request: MockRequest, _ completion: @escaping ((Error?) -> Void)) {
    request.sent = true

    completion(request.actualError)
  }

  typealias RequestType = MockRequest

  init(error: Error? = nil) {
    actualError = error
  }
}
