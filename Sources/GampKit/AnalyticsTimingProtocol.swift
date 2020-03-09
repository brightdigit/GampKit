import Foundation

public protocol AnalyticsTimingProtocol: AnalyticsTrackable {
  var time: TimeInterval { get }
  var category: String { get }
  var variable: String { get }
  var label: String? { get }
}

extension AnalyticsTimingProtocol {
  public func parameters() -> AnalyticsParameterDictionary {
    var parameters = [AnalyticsParameterKey: Any]()
    parameters[.hitType] = AnalyticsHitType.timing
    parameters[.userTimingCategory] = category
    parameters[.userTimingVariable] = variable
    parameters[.timing] = Int(round(time * 1000.0))

    if let label = label {
      parameters[.userTimingLabel] = label
    }
    return parameters
  }
}
