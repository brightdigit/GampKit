import Foundation
#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol Session {
  associatedtype RequestType: Request
  func request(withURL url: URL, cachePolicy: CachePolicy, timeoutInterval: TimeInterval) -> RequestType
  func begin(request: RequestType, _ completion: @escaping ((Error?) -> Void))
}
