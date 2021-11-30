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

  public init(
    messageType: AnalyticsHitParserMessageType,
    description: String,
    messageCode: String? = nil,
    parameter: String? = nil
  ) {
    self.messageType = messageType
    self.description = description
    self.messageCode = messageCode
    self.parameter = parameter
  }

  /**
   Type of message.
   */
  public let messageType: AnalyticsHitParserMessageType

  /**
   Additional details or steps to fix the validation issue.
   */
  public let description: String

  /**
   The message code of the issue.
   */
  public let messageCode: String?

  /**
   The parameter (if applicable) causing the validation issue.
   */
  public let parameter: String?
}
