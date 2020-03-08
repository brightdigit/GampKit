@testable import GampKit
import XCTest

struct MockRequestBuilder: AnalyticsRequestBuilderProtocol {
  func request<SessionType, RequestType>(
    forSession session: SessionType,
    withParameters _: AnalyticsParameterDictionary
  ) -> RequestType where SessionType: Session, RequestType == SessionType.RequestType {
    return session.request(withURL: .random(), cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 5.0)
  }
}

struct MockError: Error {}

final class AnalyticsSessionManagerTests: XCTestCase {
  func testSend() {
    let sentExpectation = expectation(description: "Send Completed")
    let session = MockSession(error: MockError())
    let builder = MockRequestBuilder()
    let manager = AnalyticsSessionManager(session: session, requestBuilder: builder)
    manager.send(.random()) { error in
      XCTAssert(error is MockError)
      sentExpectation.fulfill()
    }
    waitForExpectations(timeout: 5.0, handler: nil)
  }
}
