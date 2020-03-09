import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct AnalyticsURLSession: Session {
  public typealias RequestType = URLRequest

  /**
   Base URL for the request.
   */
  public let url: URL
  public let cachePolicy: URLRequest.CachePolicy
  public let session: URLSessionable
  public let timeoutInterval: TimeInterval

  public func request() -> URLRequest {
    var request = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
    request.httpMethod = "POST"
    return request
  }

  public func begin(request: URLRequest, _ completion: @escaping ((Error?) -> Void)) {
    session.dataTask(with: request, completion).resume()
  }
}
