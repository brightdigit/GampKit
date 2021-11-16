import GampKit

public struct MockTrackable: AnalyticsTrackable {
  public var hitType: AnalyticsHitType {
    .event
  }

  let key: AnalyticsParameterKey
  let value: Any
  public func parameters() -> AnalyticsParameterDictionary {
    [key: value]
  }
}
