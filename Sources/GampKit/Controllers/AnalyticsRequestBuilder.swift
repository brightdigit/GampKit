import Foundation
public struct AnalyticsRequestBuilder: AnalyticsRequestBuilderProtocol {
  public func request<SessionType, RequestType>(forSession session: SessionType, withParameters parameters: AnalyticsParameterDictionary) -> RequestType where SessionType : Session, RequestType == SessionType.RequestType {
            var request = session.request(withURL: baseURL, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
    
            request.body = parameterEncoder.encode(parameters: parameters)
            request.method = .post
            return request
      }
  
  
//  public func request<SessionType, RequestType>(forSession session: SessionType, withParameters parameters: AnalyticsParameterDictionary) -> RequestType where SessionType : Session, RequestType : Request {

//

  
  public let baseURL: URL
  public let cachePolicy: CachePolicy
  public let parameterEncoder: AnalyticsParameterEncoderProtocol
  public let timeoutInterval: TimeInterval

  public init(baseURL: URL? = nil, cachePolicy : CachePolicy = .useProtocolCachePolicy, parameterEncoder: AnalyticsParameterEncoderProtocol? = nil, timeoutInterval : TimeInterval = 5.0) {
    self.baseURL = baseURL ?? AnalyticsURLs.default
    self.parameterEncoder = parameterEncoder ?? AnalyticsParameterEncoder()
    self.cachePolicy = cachePolicy
    self.timeoutInterval = timeoutInterval
  }
  
//  public func request<SessionType, RequestType>(forSession session: SessionType, withParameters parameters: AnalyticsParameterDictionary) where SessionType : Session, RequestType : Request, SessionType.Request == (RequestType) -> RequestType {
//    var request = session.request(withURL: baseURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeoutInterval)
//    request.body = parameterEncoder.encode(parameters: parameters)
//    request.method = .post
//    return request
//  }
//
//  public func request(withParameters parameters: AnalyticsParameterDictionary) -> URLRequest {
//
//    var request = URLRequest(url: baseURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeoutInterval)
//    request.httpBody = parameterEncoder.encode(parameters: parameters)
//    request.httpMethod = "POST"
//    return request
//  }
}
