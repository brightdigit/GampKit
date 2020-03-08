@testable import GampKit
import XCTest

class MockRequest: Request {
  let url: URL
  let cachePolicy: CachePolicy
  let timeoutInterval: TimeInterval
  var body: Data?

  var sent: Bool = false
  var method: RequestMethod?
  var actualError: Error?

  init(url: URL, cachePolicy: CachePolicy, timeoutInterval: TimeInterval, body: Data?, method: RequestMethod?, actualError: Error?) {
    self.url = url
    self.cachePolicy = cachePolicy
    self.timeoutInterval = timeoutInterval
    self.body = body
    self.method = method
    self.actualError = actualError
  }
}

struct MockSession: Session {
  let actualError: Error?
  func request(withURL url: URL, cachePolicy: CachePolicy, timeoutInterval: TimeInterval) -> MockRequest {
    return MockRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval, body: nil, method: nil, actualError: actualError)
  }

  func begin(request: MockRequest, _ completion: @escaping ((Error?) -> Void)) {
    request.sent = true

    completion(request.actualError)
  }

  typealias RequestType = MockRequest

  init(error: Error? = nil) {
    actualError = error
  }
}

extension AnalyticsParameterKey: Codable {}

struct MockParameterEncoder: AnalyticsParameterEncoderProtocol {
  let encoder = JSONEncoder()
  func encode(parameters: AnalyticsParameterDictionary) -> Data? {
    return try? encoder.encode(parameters.mapValues {
      String(describing: $0)
    })
  }
}

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
