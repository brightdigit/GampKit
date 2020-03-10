/**
 Manages the sending of parameters, session, and parameters.
 */
public struct AnalyticsSessionManager<SessionType: Session>: AnalyticsSessionManagerProtocol {
  /**
   The session to call and make requests from.
   */
  public let session: SessionType

  /**
   Builds requests based on the session.
   */
  public let requestBuilder: AnalyticsRequestBuilderProtocol

  /**
   Creates a session manager based on the session and request builder.
    - Parameter session: The session for analytics.
    - Parameter requestBuilder: Builds the request for the session.
   */
  public init(session: SessionType, requestBuilder: AnalyticsRequestBuilderProtocol? = nil) {
    self.session = session
    self.requestBuilder = requestBuilder ?? AnalyticsRequestBuilder()
  }

  /**
      Creates the request and sends the request based on the session.
   - Parameter parameters: The parameters to send.
   - Parameter callback: Callback to call on completion.
   */
  public func send(_ parameters: AnalyticsParameterDictionary, _ callback: @escaping ((AnalyticsResult) -> Void)) {
    do {
      let request = try requestBuilder.request(forSession: session, withParameters: parameters)
      session.begin(request: request, callback)
    } catch {
      callback(.failure(error))
      return
    }
  }
}
