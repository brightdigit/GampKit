import GampKit

class MockSessionManager: AnalyticsSessionManagerProtocol {
  var lastParameters: AnalyticsParameterDictionary?
  func send(_ parameters: AnalyticsParameterDictionary, _ callback: @escaping ((AnalyticsResult) -> Void)) {
    lastParameters = parameters
    callback(.success(nil))
  }
}
