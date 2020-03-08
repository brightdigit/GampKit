import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public typealias CachePolicy = URLRequest.CachePolicy

public enum RequestMethod: String {
  case post = "POST"
}

public protocol Session {
  associatedtype RequestType: Request
  func request(withURL url: URL, cachePolicy: CachePolicy, timeoutInterval: TimeInterval) -> RequestType
  func begin(request: RequestType, _ completion: @escaping ((Error?) -> Void))
}

public protocol Request {
  var body: Data? { get set }
  var method: RequestMethod? { get set }
}

public protocol AnalyticsRequestBuilderProtocol {
  func request<SessionType: Session, RequestType>(forSession session: SessionType, withParameters parameters: AnalyticsParameterDictionary) -> RequestType where SessionType.RequestType == RequestType
}
