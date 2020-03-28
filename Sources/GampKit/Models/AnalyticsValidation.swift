public struct AnalyticsValidation: Codable, Equatable {
  public init(hitParsingResult: [AnalyticsHitParsingResult]) {
    self.hitParsingResult = hitParsingResult
  }

  public let hitParsingResult: [AnalyticsHitParsingResult]
}
