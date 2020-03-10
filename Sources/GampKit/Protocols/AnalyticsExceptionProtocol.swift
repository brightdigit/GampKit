public protocol AnalyticsExceptionProtocol: AnalyticsTrackable {
  var error: Error { get }
  var isFatal: Bool { get }
}

extension AnalyticsExceptionProtocol {
  public func parameters() -> AnalyticsParameterDictionary {
    var parameters = [AnalyticsParameterKey: Any]()
    parameters[.hitType] = AnalyticsHitType.exception
    parameters[.exceptionDescription] = error.localizedDescription
    parameters[.exceptionFatal] = isFatal ? 1 : 0
    return parameters
  }
}
