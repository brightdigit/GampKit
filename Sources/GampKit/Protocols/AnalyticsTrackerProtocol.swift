import Foundation

/**
 Tracker for sending items to analytics.
 */
public protocol AnalyticsTrackerProtocol {
  /**
   Tracks the trackable item.
   - Parameter trackable: The trackable item.
   - Parameter callback: What to call on completion.
   */
  func track(_ trackable: AnalyticsTrackable, _ callback: @escaping ((AnalyticsResult) -> Void))
}

public extension AnalyticsTrackerProtocol {
  /**
   Tracks the trackable the error.
   - Parameter error: The trackable error.
   - Parameter isFatal: Whether the error is fatal.
   - Parameter callback: What to call on completion.
   */
  func track(
    error: Error,
    isFatal: Bool = false,
    _ callback: @escaping ((AnalyticsResult) -> Void)
  ) {
    track(AnalyticsException(error: error, isFatal: isFatal), callback)
  }

  /**
   Tracks the timed event.
   - Parameters:
     - time: The timing to track.
     - category: The timing category.
     - variable: The timing variable.
     - label: The timing label.
     - callback: What to call on completion.
   */
  func track(
    time: TimeInterval,
    withCategory category: String,
    withVariable variable: String,
    withLabel label: String? = nil,
    _ callback: @escaping ((AnalyticsResult) -> Void)
  ) {
    track(
      AnalyticsTiming(
        time: time,
        category: category,
        variable: variable,
        label: label
      ), callback
    )
  }
}
