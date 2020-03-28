import GampKit
import XCTest

class AnalyticsURLsTests: XCTestCase {
  func testURLs() {
    XCTAssertEqual(AnalyticsURLs.release.absoluteString, "https://www.google-analytics.com/collect")
    XCTAssertEqual(AnalyticsURLs.debug.absoluteString, "https://www.google-analytics.com/debug/collect")

    let defaultUrl: URL

    #if DEBUG
      defaultUrl = AnalyticsURLs.debug
    #else
      defaultUrl = AnalyticsURLs.release
    #endif

    XCTAssertEqual(AnalyticsURLs.default, defaultUrl)
  }
}
