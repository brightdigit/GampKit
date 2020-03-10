import GampKit

public struct MockTrackable: AnalyticsTrackable {
  let key: AnalyticsParameterKey
  let value: Any
  public func parameters() -> AnalyticsParameterDictionary {
    return [key: value]
  }
}
