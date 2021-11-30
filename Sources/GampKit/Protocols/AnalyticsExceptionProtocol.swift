/**
 Trackable exception hit for Google Analytics.
 */
public protocol AnalyticsExceptionProtocol: AnalyticsTrackable {
  /**
   Source error to track.
   */
  var error: Error { get }

  /**
   Whether the error is fatal
   */
  var isFatal: Bool { get }
}

public extension AnalyticsExceptionProtocol {
  /**
   Creates a parameter dictionary based on the properties of the value.
   */
  func parameters() -> AnalyticsParameterDictionary {
    var parameters = [AnalyticsParameterKey: Any]()
    parameters[.hitType] = hitType
    parameters[.exceptionDescription] = error.localizedDescription
    parameters[.exceptionFatal] = isFatal ? 1 : 0
    return parameters
  }

  /**
   Hit type for analytics.
   */
  var hitType: AnalyticsHitType {
    .exception
  }
}
