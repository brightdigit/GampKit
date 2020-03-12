@testable import GampKit
import XCTest

final class AnalyticsRequestBuilderTests: XCTestCase {
  func testInitwParams() {
    let encoder = MockParameterEncoder(error: nil)
    let builder = AnalyticsRequestBuilder(parameterEncoder: encoder)
    XCTAssert(builder.parameterEncoder is MockParameterEncoder)
  }

  func testInitDefault() {
    let builder = AnalyticsRequestBuilder()
    XCTAssert(builder.parameterEncoder is AnalyticsParameterEncoder)
  }

  func testRequest() {
    let encoder = MockParameterEncoder(error: nil)
    let builder = AnalyticsRequestBuilder(parameterEncoder: encoder)
    let dictionary = AnalyticsParameterDictionary.random()
    let request: MockSession.RequestType
    do {
      request = try builder.request(forSession: MockSession(), withParameters: dictionary)
    } catch {
      XCTFail(error.localizedDescription)
      return
    }

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
