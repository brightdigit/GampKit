import Foundation

/**
 Trackable analytics event.
 */
public protocol AnalyticsEventProtocol: AnalyticsTrackable {
  /**
   The event category.
   */
  var category: String { get }
  /**
   The event action.
   */
  var action: String { get }
  /**
   The event label.
   */
  var label: String? { get }
  /**
   The event value.
   */
  var value: Int? { get }
}

public extension AnalyticsEventProtocol {
  /**
   Creates a parameter dictionary based on the properties of the value.
   */
  func parameters() -> AnalyticsParameterDictionary {
    var parameters = [AnalyticsParameterKey: Any]()
    parameters[.hitType] = hitType
    parameters[.eventCategory] = category
    parameters[.eventAction] = action

    if let label = label {
      parameters[.eventLabel] = label
    }

    if let value = value {
      parameters[.eventValue] = value
    }
    return parameters
  }

  /**
   Hit type for analytics.
   */
  var hitType: AnalyticsHitType {
    .event
  }
}
