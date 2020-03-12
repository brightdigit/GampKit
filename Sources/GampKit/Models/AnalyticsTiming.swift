import Foundation

/**
 A timed event for tracking.
 */
public struct AnalyticsTiming: AnalyticsTimingProtocol {
  /**
   The timing to track.
   */
  public let time: TimeInterval

  /**
   The timing category.
   */
  public let category: String

  /**
   The timing variable.
   */
  public let variable: String

  /**
   The timing label.
   */
  public let label: String?
}
