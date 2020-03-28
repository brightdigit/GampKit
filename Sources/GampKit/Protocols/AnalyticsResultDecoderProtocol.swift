import Foundation
public protocol AnalyticsResultDecoderProtocol {
  func decode(_ data: Data) -> AnalyticsResult
}
