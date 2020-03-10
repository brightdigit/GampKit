import Foundation
#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif
/**
 Abstraction for making URLRequests.
 */
public protocol URLSessionable {
  /**
   Creates the URLRequestDataTask and calls resume.
   - Parameter request: The URLRequest.
   - Parameter completion: What to call when the call is completed.
   - Returns: The URLSession Task.
   */
  func dataTask(with request: URLRequest, _ completion: @escaping (AnalyticsResult) -> Void) -> URLSessionableDataTask
}
