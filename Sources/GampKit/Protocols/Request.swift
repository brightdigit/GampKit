import Foundation

/**
 Analytics request to send.
 */
public protocol Request {
  /**
   Data to send with the request
   */
  var body: Data? { get set }
}
