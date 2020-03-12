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
   Creates a tracker based on the configuration and session manager.
   - Parameter configuration: The static configuration for the tracker.
   - Parameter debugMode: True, to use the validation server; False, use the actual tracking url; Nil, use the default server based on build.
   */
  public init(configuration: AnalyticsConfigurationProtocol, debugMode: Bool?) {
    self.configuration = configuration
    let url: URL
    switch debugMode {
    case .none: url = AnalyticsURLs.default
    case .some(false): url = AnalyticsURLs.release
    case .some(true): url = AnalyticsURLs.debug
    }
    sessionManager = AnalyticsSessionManager(session: AnalyticsURLSession(url: url))
  }

  /**
   Tracks the trackable item.
   - Parameter trackable: The trackable item.
   - Parameter callback: What to call on completion.
   */
  public func track(_ trackable: AnalyticsTrackable, _ callback: @escaping ((AnalyticsResult) -> Void)) {
    let parameters = configuration.parameters().merging(trackable.parameters()) { _, newValue in
      newValue
    }
    sessionManager.send(parameters, callback)
  }
}
