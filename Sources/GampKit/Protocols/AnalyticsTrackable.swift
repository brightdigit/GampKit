/**
 Google Analytics tracking hit.
 */
public protocol AnalyticsTrackable: AnalyticsParameterable {
  /**
   Hit type for analytics.
   */
  var hitType: AnalyticsHitType {
    get
  }
}
