import Foundation
public typealias AnalyticsResult = Result<AnalyticsValidation?, Error>

// public protocol AnalyticsValidationHitProtocol {}

public enum AnalyticsHitParserMessageType: String, Codable {
  case info = "INFO"
  case warn = "WARN"
  case error = "ERROR"
}

public struct AnalyticsHitParserMessage: Codable {
  let messageCode: String?
  let messageType: AnalyticsHitParserMessageType
  let description: String
  let parameter: String?
}

public struct AnalyticsHitParsingResult: Codable {
  let valid: Bool
  let hit: String
  let parserMessage: [AnalyticsHitParserMessage]
}

public struct AnalyticsValidation: Codable {
  let hitParsingResult: [AnalyticsHitParsingResult]
}

public extension AnalyticsResult {
  init(error: Error?) {
    if let error = error {
      self = .failure(error)
    } else {
      self = .success(nil)
    }
  }
}
