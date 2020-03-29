import Foundation
/**
 Decodes the data from the `URLSession`data task into an `AnalyticsResult`.
 */
public struct AnalyticsResultDecoder: AnalyticsResultDecoderProtocol {
  /**
   Used to check if the `Data` is in JSON format.
   */
  
  public static let leftBracket : UInt8 = 123
  
  public init() {}

  /**
    Decodes the data from `URLSession` into an `AnalyticsResult`.
   - Parameter data: The `URLSession` data task.
   */
  public func decode(_ data: Data) -> AnalyticsResult {
    guard data.first == Self.leftBracket else {
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
