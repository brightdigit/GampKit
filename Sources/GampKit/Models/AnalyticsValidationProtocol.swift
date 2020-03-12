public typealias AnalyticsResult = Result<AnalyticsValidationProtocol?, Error>

public protocol AnalyticsValidationProtocol {}

public extension AnalyticsResult {
  init(error: Error?) {
    if let error = error {
      self = .failure(error)
    } else {
      self = .success(nil)
    }
  }
}
