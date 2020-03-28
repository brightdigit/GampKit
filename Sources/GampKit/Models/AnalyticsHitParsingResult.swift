public struct AnalyticsHitParsingResult: Codable, Equatable {
  public init(valid: Bool, hit: String, parserMessage: [AnalyticsHitParserMessage]) {
    self.valid = valid
    self.hit = hit
    self.parserMessage = parserMessage
  }

  public let valid: Bool
  public let hit: String
  public let parserMessage: [AnalyticsHitParserMessage]
}
