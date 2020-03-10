import Foundation
/**
 Tracker for sending items to analytics.
 */
public struct AnalyticsTracker: AnalyticsTrackerProtocol {
  /**
   The static configuration for the tracker.
   */
  let configuration: AnalyticsConfigurationProtocol
  /**
   The session manager for sending data.
   */
  let sessionManager: AnalyticsSessionManagerProtocol

  /**
   Creates a tracker based on the configuration and session manager.
   - Parameter configuration: The static configuration for the tracker.
   - Parameter sessionManager: The session manager for sending data.
   */
  public init(configuration: AnalyticsConfigurationProtocol, sessionManager: AnalyticsSessionManagerProtocol? = nil) {
    self.configuration = configuration
    self.sessionManager = sessionManager ?? AnalyticsSessionManager(session: AnalyticsURLSession())
  }

  /**
   Tracks the trackable item.
   - Parameter trackable: The trackable item.
   - Parameter callback: What to call on completion.
   */
  public func track(_ trackable: AnalyticsTrackable, _ callback: @escaping ((Error?) -> Void)) {
    let parameters = configuration.parameters().merging(trackable.parameters()) { _, newValue in
      newValue
    }
    sessionManager.send(parameters, callback)
  }
}
