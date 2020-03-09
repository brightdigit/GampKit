import Foundation

public protocol Request {
  var body: Data? { get set }
  var method: RequestMethod? { get set }
}
