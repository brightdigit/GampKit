import Foundation

public protocol AnalyticsEventProtocol: AnalyticsTrackable {
  var category: String { get }
  var action: String { get }
  var label: String? { get }
  var value: Int? { get }
}

extension AnalyticsEventProtocol {
  public func parameters() -> AnalyticsParameterDictionary {
    var parameters = [AnalyticsParameterKey: Any]()
    parameters[.hitType] = AnalyticsHitType.event
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
}
