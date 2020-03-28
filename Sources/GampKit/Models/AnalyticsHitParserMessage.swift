public class AnalyticsHitParserMessage: Codable, Equatable {
  public static func == (lhs: AnalyticsHitParserMessage, rhs: AnalyticsHitParserMessage) -> Bool {
    guard lhs.messageType == rhs.messageType else {
      return false
    }

    guard lhs.description == rhs.description else {
      return false
    }

    guard lhs.messageCode == rhs.messageCode else {
      return false
    }

    guard lhs.parameter == rhs.parameter else {
      return false
    }

    return true
  }

  public init(messageType: AnalyticsHitParserMessageType, description: String, messageCode: String? = nil, parameter: String? = nil) {
    self.messageType = messageType
    self.description = description
    self.messageCode = messageCode
    self.parameter = parameter
  }

  public let messageType: AnalyticsHitParserMessageType
  public let description: String
  public let messageCode: String?
  public let parameter: String?
}
