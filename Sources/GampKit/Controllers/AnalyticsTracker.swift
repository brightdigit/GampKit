import Foundation

public struct AnalyticsTracker: AnalyticsTrackerProtocol {
  let configuration: AnalyticsConfigurationProtocol
  let sessionManager: AnalyticsSessionManagerProtocol

  public func track(_ trackable: AnalyticsTrackable, _ callback: @escaping ((Error?) -> Void)) {
    let parameters = configuration.parameters.merging(trackable.parameters()) { _, newValue in
      newValue
    }
    sessionManager.send(parameters, callback)
  }
}
