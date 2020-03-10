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

extension AnalyticsEventProtocol {
  /**
   Creates a parameter dictionary based on the properties of the value.
   */
  public func parameters() -> AnalyticsParameterDictionary {
    var parameters = [AnalyticsParameterKey: Any]()
    parameters[.hitType] = hitType
    parameters[.eventCategory] = category
    parameters[.eventAction] = action

    if let label = self.label {
      parameters[.eventLabel] = label
    }

    if let value = self.value {
      parameters[.eventValue] = value
    }
    return parameters
  }

  /**
   Hit type for analytics.
   */
  public var hitType: AnalyticsHitType {
    return .event
  }
}
