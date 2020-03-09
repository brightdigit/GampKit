import Foundation
import GampKit

class MockRequest: Request {
  var body: Data?

  var sent: Bool = false
  var actualError: Error?

  init(body: Data?, actualError: Error?) {
    self.body = body
    self.actualError = actualError
  }
}
