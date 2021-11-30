import GampKit
extension AnalyticsHitParserMessage {
  func rand<PropertyType: Randomizable>(
    _ key: WritableKeyPath<AnalyticsHitParserMessageBuilder, PropertyType>
  ) -> AnalyticsHitParserMessage {
    var item = AnalyticsHitParserMessageBuilder(message: self)
    item[keyPath: key] = PropertyType.random()
    return item.message()
  }

  func rand<PropertyType>(
    _ key: WritableKeyPath<AnalyticsHitParserMessageBuilder, PropertyType>,
    _ value: PropertyType
  ) -> AnalyticsHitParserMessage {
    var item = AnalyticsHitParserMessageBuilder(message: self)
    item[keyPath: key] = value
    return item.message()
  }
}

public class AnalyticsHitParserMessageBuilder {
  public init(message: AnalyticsHitParserMessage) {
    messageType = message.messageType
    description = message.description
    messageCode = message.messageCode
    parameter = message.parameter
  }

  public var messageType: AnalyticsHitParserMessageType
  public var description: String
  public var messageCode: String?
  public var parameter: String?

  public func message() -> AnalyticsHitParserMessage {
    AnalyticsHitParserMessage(
      messageType: messageType,
      description: description,
      messageCode: messageCode,
      parameter: parameter
    )
  }
}
