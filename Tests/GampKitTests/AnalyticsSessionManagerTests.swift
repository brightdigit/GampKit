@testable import GampKit
import XCTest




final class AnalyticsSessionManagerTests: XCTestCase {
  func testSend() {
    let sentExpectation = expectation(description: "Send Completed")
    let description = String.random()
    let session = MockSession(error: MockError(description: description))
    let builder = MockRequestBuilder()
    let manager = AnalyticsSessionManager(session: session, requestBuilder: builder)
    manager.send(.random()) { error in
      XCTAssert(error is MockError)
      sentExpectation.fulfill()
    }
    waitForExpectations(timeout: 5.0, handler: nil)
  }
}
