import Foundation

public protocol AnalyticsTimingProtocol: AnalyticsTrackable {
  /**
   The timing to track.
   */
  var time: TimeInterval { get }

  /**
   The timing category.
   */
  var category: String { get }
  /**
   The timing variable.
   */
  var variable: String { get }

  /**
   The timing label.
   */
  var label: String? { get }
}

/**
 A timed event for tracking.
 */
public extension AnalyticsTimingProtocol {
  /**
   Creates a parameter dictionary based on the properties of the value.
   */
  func parameters() -> AnalyticsParameterDictionary {
    var parameters = [AnalyticsParameterKey: Any]()
    parameters[.hitType] = hitType
    parameters[.userTimingCategory] = category
    parameters[.userTimingVariable] = variable
    parameters[.timing] = Int(round(time * 1_000.0))

    if let label = label {
      parameters[.userTimingLabel] = label
    }
    return parameters
  }

  /**
   Hit type for analytics.
   */
  var hitType: AnalyticsHitType {
    .timing
  }
}
