import Foundation

public protocol Request {
  var body: Data? { get set }
}
