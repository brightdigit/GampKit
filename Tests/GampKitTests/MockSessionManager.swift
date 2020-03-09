import GampKit

class MockSessionManager : AnalyticsSessionManagerProtocol {
  var lastParameters : AnalyticsParameterDictionary?
  func send(_ parameters: AnalyticsParameterDictionary, _ callback: @escaping ((Error?) -> Void)) {
    lastParameters = parameters
    callback(nil)
  }
  
  
}
