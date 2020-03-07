import Foundation

public struct AnalyticsTracker: AnalyticsTrackerProtocol {
  public func track(error: Error, isFatal: Bool, _ callback: @escaping ((Error?) -> Void)) {
    var parameters = configuration.parameters

    parameters[.hitType] = AnalyticsHitType.exception
    parameters[.exceptionDescription] = error.localizedDescription
    parameters[.exceptionFatal] = isFatal ? 1 : 0

    sessionManager.send(parameters, callback)
  }

  public func track(event: AnalyticsEventProtocol, _ callback: @escaping ((Error?) -> Void)) {
    var parameters = configuration.parameters

    parameters[.hitType] = AnalyticsHitType.event
    parameters[.eventCategory] = event.category
    parameters[.eventAction] = event.action

    if let label = event.label {
      parameters[.eventLabel] = label
    }

    if let value = event.value {
      parameters[.eventValue] = value
    }

    sessionManager.send(parameters, callback)
  }

  let configuration: AnalyticsConfigurationProtocol
  let sessionManager: AnalyticsSessionManagerProtocol

  public func track(
    time: TimeInterval,
    withCategory category: String,
    withVariable variable: String,
    withLabel label: String?,
    _ callback: @escaping ((Error?) -> Void)
  ) {
    var parameters = configuration.parameters

    parameters[.hitType] = AnalyticsHitType.timing
    parameters[.userTimingCategory] = category
    parameters[.userTimingVariable] = variable
    parameters[.timing] = Int(round(time * 1000.0))

    if let label = label {
      parameters[.userTimingLabel] = label
    }

    sessionManager.send(parameters, callback)
  }
}
