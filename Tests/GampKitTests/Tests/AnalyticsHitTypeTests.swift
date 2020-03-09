@testable import GampKit
import XCTest

class AnalyticsHitTypeTests: XCTestCase {
  func testValues() {
    XCTAssertEqual(AnalyticsHitType.event.description, "event")
    XCTAssertEqual(AnalyticsHitType.exception.description, "exception")
    XCTAssertEqual(AnalyticsHitType.timing.description, "timing")
  }
}
