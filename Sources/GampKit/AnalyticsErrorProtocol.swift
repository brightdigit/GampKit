public protocol AnalyticsErrorProtocol: AnalyticsTrackable {
  var originalError: Error { get }
  var isFatal: Bool { get }
}

extension AnalyticsErrorProtocol {
  public func parameters() -> AnalyticsParameterDictionary {
    var parameters = [AnalyticsParameterKey: Any]()
    parameters[.hitType] = AnalyticsHitType.exception
    parameters[.exceptionDescription] = originalError.localizedDescription
    parameters[.exceptionFatal] = isFatal ? 1 : 0
    return parameters
  }
}
