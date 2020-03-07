import Foundation

public struct AnalyticsParameterEncoder: AnalyticsParameterEncoderProtocol {
  public func encode(parameters: AnalyticsParameterDictionary) -> Data? {
    return parameters.map {
      Self.parameterString(fromKey: $0.key, withValue: $0.value)
    }.joined(separator: "&").data(using: .utf8)
  }

  static func parameterString(fromKey key: AnalyticsParameterKey, withValue value: Any) -> String {
    "\(key.rawValue)=\(String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)"
  }
}
