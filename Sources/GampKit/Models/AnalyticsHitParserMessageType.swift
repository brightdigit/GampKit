/**
 The message type of each `AnalyticsHitParserMessage`.
 */
public enum AnalyticsHitParserMessageType: String, Codable, CaseIterable {
  case info = "INFO"
  case warn = "WARN"
  case error = "ERROR"
}
