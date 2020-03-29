/**
 The response from validation call.
 */
public struct AnalyticsValidation: Codable, Equatable {
  /**
   Create the response from validation call.
   */
  public init(hitParsingResult: [AnalyticsHitParsingResult]) {
    self.hitParsingResult = hitParsingResult
  }

  /**
   An array which represents the hits sent in the original request.
   */
  public let hitParsingResult: [AnalyticsHitParsingResult]
}
