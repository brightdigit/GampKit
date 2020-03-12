import Foundation

/**
 Manages the sending of parameters, session, and parameters.
 */
public protocol AnalyticsSessionManagerProtocol {
  /**
      Creates the request and sends the request based on the session.
   - Parameter parameters: The parameters to send.
   - Parameter callback: Callback to call on completion.
   */
  func send(_ parameters: AnalyticsParameterDictionary, _ callback: @escaping ((AnalyticsResult) -> Void))
}
