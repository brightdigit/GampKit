import Foundation
import GampKit

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
