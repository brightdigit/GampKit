@testable import GampKit
import XCTest

struct MockRequest : Request {
  let url : URL
  let cachePolicy: CachePolicy
  let timeoutInterval: TimeInterval
  var body: Data?
  
  var method: RequestMethod?
  
  
}
struct MockSession : Session {
  func request(withURL url: URL, cachePolicy: CachePolicy, timeoutInterval: TimeInterval) -> MockRequest {
    return MockRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval, body: nil, method: nil)
  }
  
  func begin(request: MockRequest, _ completion: @escaping ((Error?) -> Void)) {
    
  }
  
  typealias RequestType = MockRequest
  
  
}

extension AnalyticsParameterKey : Codable {
  
}
struct MockParameterEncoder : AnalyticsParameterEncoderProtocol {
  let encoder = JSONEncoder()
  func encode(parameters: AnalyticsParameterDictionary) -> Data? {
    
    return try? encoder.encode(parameters.mapValues{
      String(describing: $0)
    })
  }
  
  
}
final class AnalyticsRequestBuilderTests: XCTestCase {
  func testRequest () {
    let url = URL.random()
    let timeout = TimeInterval.random()
    let range : ClosedRange<UInt>
    range = (0...5)
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
    let actualDictionary : [AnalyticsParameterKey : String]
    do {
      actualDictionary = try decoder.decode([AnalyticsParameterKey : String].self, from: body)
    } catch let error {
      XCTFail(error.localizedDescription)
      return
    }
    
    let expectedDictionary = dictionary.mapValues(String.init(describing:))
    XCTAssertEqual(actualDictionary, expectedDictionary)
  }
}
