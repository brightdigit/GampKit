import Foundation
public struct AnalyticsRequestBuilder: AnalyticsRequestBuilderProtocol {
  public let baseURL: URL
  public let cachePolicy: CachePolicy
  public let parameterEncoder: AnalyticsParameterEncoderProtocol
  public let timeoutInterval: TimeInterval

  public init(
    baseURL: URL? = nil,
    cachePolicy: CachePolicy = .useProtocolCachePolicy,
    parameterEncoder: AnalyticsParameterEncoderProtocol? = nil,
    timeoutInterval: TimeInterval = 5.0
  ) {
    self.baseURL = baseURL ?? AnalyticsURLs.default
    self.parameterEncoder = parameterEncoder ?? AnalyticsParameterEncoder()
    self.cachePolicy = cachePolicy
    self.timeoutInterval = timeoutInterval
  }

  public func request<SessionType, RequestType>(
    forSession session: SessionType,
    withParameters parameters: AnalyticsParameterDictionary
  ) throws -> RequestType where SessionType: Session, RequestType == SessionType.RequestType {
    var request = session.request(withURL: baseURL, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)

    request.body = try parameterEncoder.encode(parameters: parameters)
    request.method = .post
    return request
  }
}
