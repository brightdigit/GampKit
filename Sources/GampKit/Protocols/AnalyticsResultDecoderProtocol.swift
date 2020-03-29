import Foundation
public protocol AnalyticsResultDecoderProtocol {
  func decode(_ data: Data) -> AnalyticsResult
}

public extension AnalyticsResultDecoderProtocol {
  func decode(_ data: Data?, _ error: Error?) -> AnalyticsResult {
    if let error = error {
      return .failure(error)
    } else if let data = data {
      return decode(data)
    } else {
      return .success(nil)
    }
  }
}
