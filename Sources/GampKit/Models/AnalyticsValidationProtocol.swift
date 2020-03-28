public typealias AnalyticsResult = Result<AnalyticsValidationProtocol?, Error>

public protocol AnalyticsValidationHitProtocol {}

public struct AnalyticsHitPath {
  let method: String
  let path: String
  let scheme: String
}

public enum AnalyticsHitParserMessageType {
  case info
  case warn
  case error
}

public struct AnalyticsHitParserMessage {
  let messageType: AnalyticsHitParserMessageType
  let description: String
  let parameter: String?
}

public struct AnalyticsHitParsingResult {
  let valid: Bool
  let hit: AnalyticsHitPath
  let parserMessage: [AnalyticsHitParserMessage]
}

public protocol AnalyticsValidationProtocol {
  var hitParsingResult: [AnalyticsHitParsingResult] { get }
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
