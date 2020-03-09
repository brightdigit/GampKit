@testable import GampKit
import XCTest

final class AnalyticsRequestBuilderTests: XCTestCase {
  func testRequest() {
    let url = URL.random()
    let timeout = TimeInterval.random()
    let range: ClosedRange<UInt>
    range = (0 ... 5)
    let cachePolicy = CachePolicy(rawValue: UInt.random(in: range))!
    let encoder = MockParameterEncoder()
    let builder = AnalyticsRequestBuilder(baseURL: url, cachePolicy: cachePolicy, parameterEncoder: encoder, timeoutInterval: timeout)
    let dictionary = AnalyticsParameterDictionary.random()
    let request = builder.request(forSession: MockSession(), withParameters: dictionary)

    XCTAssertEqual(url, request.url)
    XCTAssertEqual(timeout, request.timeoutInterval)
    XCTAssertEqual(.post, request.method)

    XCTAssertEqual(request.cachePolicy, cachePolicy)
    guard let body = request.body else {
      XCTFail("Request body is nil")
      return
    }

    let decoder = JSONDecoder()
    let actualDictionary: [AnalyticsParameterKey: String]
    do {
      actualDictionary = try decoder.decode([AnalyticsParameterKey: String].self, from: body)
    } catch {
      XCTFail(error.localizedDescription)
      return
    }

    let expectedDictionary = dictionary.mapValues(String.init(describing:))
    XCTAssertEqual(actualDictionary, expectedDictionary)
  }
}
