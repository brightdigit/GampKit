import Foundation
import GampKit

struct MockSession: Session {
  let actualError: Error?
  func request() -> MockRequest {
    return MockRequest(body: nil, actualError: actualError)
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
