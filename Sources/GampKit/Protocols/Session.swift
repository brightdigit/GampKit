import Foundation
#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol Session {
  associatedtype RequestType: Request
  func request() -> RequestType
  func begin(request: RequestType, _ completion: @escaping ((Error?) -> Void))
}
