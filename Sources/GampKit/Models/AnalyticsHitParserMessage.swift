public struct AnalyticsHitParserMessage: Codable {
  let messageCode: String?
  let messageType: AnalyticsHitParserMessageType
  let description: String
  let parameter: String?
}
