import Foundation
import GampKit

struct MockSession: Session {
  let actualError: Error?
  func request() -> MockRequest {
    return MockRequest(body: nil, actualError: actualError)
  }

  func begin(request: MockRequest, _ completion: @escaping ((AnalyticsResult) -> Void)) {
    request.sent = true

    completion(AnalyticsResult(error: request.actualError))
  }

  typealias RequestType = MockRequest

  init(error: Error? = nil) {
    actualError = error
  }
}
