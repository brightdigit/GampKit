import Foundation

public protocol AnalyticsParameterEncoderProtocol {
  func encode(parameters: AnalyticsParameterDictionary) -> Data?
}
