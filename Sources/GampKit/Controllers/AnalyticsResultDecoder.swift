import Foundation
public struct AnalyticsResultDecoder: AnalyticsResultDecoderProtocol {
  public func decode(_ data: Data) -> AnalyticsResult {
    guard data.first == 123 else {
      return .success(nil)
    }
    let validation: AnalyticsValidation
    let jsonDecoder = JSONDecoder()
    do {
      validation = try jsonDecoder.decode(AnalyticsValidation.self, from: data)
    } catch {
      return AnalyticsResult(error: error)
    }
    return .success(validation)
  }
}
