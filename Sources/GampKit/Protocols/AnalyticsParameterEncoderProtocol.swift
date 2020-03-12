import Foundation

/**
 Encodes the parameters for use by the analytics tracker.
 */
public protocol AnalyticsParameterEncoderProtocol {
  /**
   Encodes the parameters for use by the analytics tracker.

   - Parameter parameters: the dictionary of values to encode
   - Returns: Data, if can be encoded
   */
  func encode(parameters: AnalyticsParameterDictionary) throws -> Data
}
