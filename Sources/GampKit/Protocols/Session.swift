import Foundation
#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/**
 Session used for making and sending requests.
 */
public protocol Session {
  associatedtype RequestType: Request
  /**
   Creates the URLRequest.
   */
  func request() -> RequestType
  /**
   Makes the request.
   - Parameters:
     - request: The URLRequest
     - completion: Callback to call when the request is finished.
   */
  func begin(request: RequestType, _ completion: @escaping ((AnalyticsResult) -> Void))
}
