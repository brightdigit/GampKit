@testable import GampKit
import XCTest

final class GampKitTests: XCTestCase {
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    XCTAssertEqual(GampKit().text, "Hello, World!")
  }

  static var allTests = [
    ("testExample", testExample)
  ]
}
