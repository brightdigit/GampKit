/**
 Result from a hit sent in the original request.
 */
public struct AnalyticsHitParsingResult: Codable, Equatable {
  public init(valid: Bool, hit: String, parserMessage: [AnalyticsHitParserMessage]) {
    self.valid = valid
    self.hit = hit
    self.parserMessage = parserMessage
  }

  /**
   True for valid hits, false for invalid hits.
   */
  public let valid: Bool
  
  /**
   A string containing the path of the request as well as its method and protocol.
   */
  public let hit: String
  
  /**
   A list of parser messages. If the hit is valid, this array will be empty.
   */
  public let parserMessage: [AnalyticsHitParserMessage]
}
