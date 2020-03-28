public struct AnalyticsHitParsingResult: Codable {
  let valid: Bool
  let hit: String
  let parserMessage: [AnalyticsHitParserMessage]
}
