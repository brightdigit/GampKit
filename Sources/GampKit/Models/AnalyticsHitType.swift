/**
 Hit type for analytics.
 */
public enum AnalyticsHitType: String, CustomStringConvertible {
  /**
   Timing Hit Type.
   */
  case timing
  /**
   Event Hit Type.
   */
  case event
  /**
   Exception Hit Type.
   */
  case exception

  public var description: String {
    rawValue
  }
}
