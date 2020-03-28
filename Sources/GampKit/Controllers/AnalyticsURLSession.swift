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

  /**
   Cache policy for URLRequest.
   */
  public let cachePolicy: URLRequest.CachePolicy

  /**
   URL Session.
   */
  public let session: URLSessionable

  /**
   Timeout for URLRequest.
   */
  public let timeoutInterval: TimeInterval

  public let resultDecoder: AnalyticsResultDecoderProtocol

  /**
   Creates the URL Session to use for analytics.
   - Parameters:
     - url: Optional URL for analytics URL
     - cachePolicy: Cache policy for URLRequest.
     - timeoutInterval: Timeout for URLRequest.
     - session: URL Session for URLRequest.
   */
  public init(url: URL? = nil,
              cachePolicy: URLRequest.CachePolicy? = nil,
              session: URLSessionable? = nil,
              timeoutInterval: TimeInterval? = nil,
              resultDecoder: AnalyticsResultDecoderProtocol? = nil) {
    self.url = url ?? AnalyticsURLs.default
    self.cachePolicy = cachePolicy ?? .useProtocolCachePolicy
    self.timeoutInterval = timeoutInterval ?? 5.0
    self.session = session ?? URLSession.shared
    self.resultDecoder = resultDecoder ?? AnalyticsResultDecoder()
  }

  /**
   Creates the URLRequest.
   */
  public func request() -> URLRequest {
    var request = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
    request.httpMethod = "POST"
    return request
  }

  /**
   Makes the request.
   - Parameters:
     - request: The URLRequest
     - completion: Callback to call when the request is finished.
   */
  public func begin(request: URLRequest, _ completion: @escaping ((AnalyticsResult) -> Void)) {
    session.dataTask(with: request, decodeWith: resultDecoder, completion).resume()
  }
}
