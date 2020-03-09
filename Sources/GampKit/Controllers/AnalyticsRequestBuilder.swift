import Foundation

/**
 Builds a analytics request based on the session.
 */
public struct AnalyticsRequestBuilder: AnalyticsRequestBuilderProtocol {
  public let parameterEncoder: AnalyticsParameterEncoderProtocol

  public init(
    parameterEncoder: AnalyticsParameterEncoderProtocol? = nil
  ) {
    // self.baseURL = baseURL ?? AnalyticsURLs.default
    self.parameterEncoder = parameterEncoder ?? AnalyticsParameterEncoder()
    // self.cachePolicy = cachePolicy
    // self.timeoutInterval = timeoutInterval
  }

  /**
   Builds a analytics request based on the session and parameters.

   - Parameter session: The session to build the request for.
   - Parameter parameters: A dictionary of parameters for the analytics request.

   */
  public func request<SessionType, RequestType>(
    forSession session: SessionType,
    withParameters parameters: AnalyticsParameterDictionary
  ) throws -> RequestType where SessionType: Session, RequestType == SessionType.RequestType {
    var request = session.request()

    request.body = try parameterEncoder.encode(parameters: parameters)
    return request
  }
}
