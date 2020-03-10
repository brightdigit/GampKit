import Foundation

/**
 Builds a analytics request based on the session.
 */
public struct AnalyticsRequestBuilder: AnalyticsRequestBuilderProtocol {
  /**
   The parameter encoder.
   */
  public let parameterEncoder: AnalyticsParameterEncoderProtocol

  /**
   Creates the request builder based on the parameter encoder.
    - Parameter parameterEncoder: Encodes the parameters for the request.
   */
  public init(
    parameterEncoder: AnalyticsParameterEncoderProtocol? = nil
  ) {
    self.parameterEncoder = parameterEncoder ?? AnalyticsParameterEncoder()
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
