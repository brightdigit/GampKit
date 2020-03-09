import Foundation
@testable import GampKit
import XCTest

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

class MockDataTask: URLSessionableDataTask {
  let error: Error?
  let completion: (Error?) -> Void
  var isCompleted = false
  func resume() {
    completion(error)
    isCompleted = true
  }

  init(error: Error?, completion: @escaping (Error?) -> Void) {
    self.error = error
    self.completion = completion
  }
}

class MockURLSession: URLSessionable {
  let error: Error?
  var lastTask: MockDataTask?
  init(error: Error?) {
    self.error = error
  }

  func dataTask(with _: URLRequest, _ completion: @escaping (Error?) -> Void) -> URLSessionableDataTask {
    let task = MockDataTask(error: error, completion: completion)
    lastTask = task
    return task
  }

  var lastTaskCompleted: Bool {
    return lastTask?.isCompleted ?? false
  }
}

final class AnalyticsURLSessionTests: XCTestCase {
  func testInit() {
    let taskException = expectation(description: "urlsession-completed")
    var actualError: Error?
    let expectedError: Error? = nil
    let url = URL.random()
    let range: ClosedRange<UInt> = (0 ... 5)
    let cachePolicy = URLRequest.CachePolicy(rawValue: UInt.random(in: range))!
    let timeoutInterval = TimeInterval.random()
    let mockSession = MockURLSession(error: expectedError)
    let session = AnalyticsURLSession(url: url, cachePolicy: cachePolicy, session: mockSession, timeoutInterval: timeoutInterval)
    var request = session.request()
    let uint8Range = (UInt8.min ... UInt8.max)

    let data = Data((0 ... 255).map { _ in
      UInt8.random(in: uint8Range)
    })
    request.body = data
    XCTAssertEqual(request.url, url)
    XCTAssertEqual(request.cachePolicy, cachePolicy)
    XCTAssertEqual(request.timeoutInterval, timeoutInterval)
    XCTAssertEqual(request.body, request.httpBody)
    XCTAssertEqual(request.httpBody, data)

    session.begin(request: request) { error in
      actualError = error
      taskException.fulfill()
    }
    waitForExpectations(timeout: 1000) { error in
      XCTAssertNil(error)
      XCTAssertEqual(expectedError?.localizedDescription, actualError?.localizedDescription)
      XCTAssertTrue(mockSession.lastTaskCompleted)
    }
  }
}
