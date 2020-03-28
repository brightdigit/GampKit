public typealias AnalyticsResult = Result<AnalyticsValidation?, Error>

public extension AnalyticsResult {
  init(error: Error?) {
    if let error = error {
      self = .failure(error)
    } else {
      self = .success(nil)
    }
  }
}
