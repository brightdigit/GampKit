import GampKit
import XCTest

class AnalyticsHitParserMessageTests: XCTestCase {
  func testEquality() {
    let lhs = AnalyticsHitParserMessage(messageType: .info, description: String.random(), messageCode: String.random(), parameter: String.random())
    let rhs = AnalyticsHitParserMessageBuilder(message: lhs).message()
    XCTAssertNotEqual(lhs, lhs.rand(\.description))
    XCTAssertNotEqual(lhs, lhs.rand(\.messageCode))
    XCTAssertNotEqual(lhs, lhs.rand(\.parameter))
    XCTAssertNotEqual(lhs, lhs.rand(\.messageType, .warn))
    XCTAssertEqual(lhs, rhs)
  }
}
