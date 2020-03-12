@testable import GampKit
import XCTest

final class AnalyticsSessionManagerTests: XCTestCase {
  func testInit() {
    let manager = AnalyticsSessionManager(session: MockSession(error: nil))
    XCTAssert(manager.requestBuilder is AnalyticsRequestBuilder)
  }

  func testSessionErrorSend() {
    let sentExpectation = expectation(description: "Send Completed")
    let description = String.random()
    let session = MockSession(error: MockError(description: description))
    let builder = MockRequestBuilder(error: nil)
    let manager = AnalyticsSessionManager(session: session, requestBuilder: builder)
    manager.send(.random()) { result in
      guard case let .failure(error) = result else {
        XCTFail("Invalid or Missing Error")
        return
      }
      XCTAssertEqual(description, error.localizedDescription)
      sentExpectation.fulfill()
    }
    waitForExpectations(timeout: 5.0, handler: nil)
  }

  func testBuilderErrorSend() {
    let sentExpectation = expectation(description: "Send Completed")
    let session = MockSession(error: nil)
    let errorString = String.random()
    let builder = MockRequestBuilder(error: MockError(description: errorString))
    let manager = AnalyticsSessionManager(session: session, requestBuilder: builder)
    manager.send(.random()) { result in
      guard case let .failure(error) = result else {
        XCTFail("Invalid or Missing Error")
        return
      }
      XCTAssertEqual(errorString, error.localizedDescription)
      sentExpectation.fulfill()
    }
    waitForExpectations(timeout: 5.0, handler: nil)
  }
}
