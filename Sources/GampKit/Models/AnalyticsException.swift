/**
 Trackable exception hit for Google Analytics.
 */
public struct AnalyticsException: AnalyticsExceptionProtocol {
  /**
   Source error to track.
   */
  public let error: Error
  /**
   Whether the error is fatal
   */
  public let isFatal: Bool
}
