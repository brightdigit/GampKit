import Foundation

/**
 Encodes the parameters for use by the analytics tracker.
 */
public struct AnalyticsParameterEncoder: AnalyticsParameterEncoderProtocol {
  /**
   Encodes the parameters for use by the analytics tracker.

   - Parameter parameters: the dictionary of values to encode
   - Returns: Encoded data
   - Throws:
        - `StringEncodingError`
            if the encoded string can not be converted to `Data`.
   */
  public func encode(parameters: AnalyticsParameterDictionary) throws -> Data {
    let data = parameters.map {
      Self.parameterString(fromKey: $0.key, withValue: $0.value)
    }.joined(separator: "&").data(using: .utf8)
    guard let result = data else {
      throw StringEncodingError()
    }
    return result
  }

  static func parameterString(fromKey key: AnalyticsParameterKey, withValue value: Any) -> String {
    "\(key.rawValue)=\(String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)"
  }
}
