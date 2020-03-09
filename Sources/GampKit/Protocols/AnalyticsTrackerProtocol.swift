import Foundation

public protocol AnalyticsTrackerProtocol {
  func track(_ trackable: AnalyticsTrackable, _ callback: @escaping ((Error?) -> Void))
}

public struct AnalyticsError: AnalyticsErrorProtocol {
  public let originalError: Error

  public let isFatal: Bool
}

extension AnalyticsTrackerProtocol {
  public func track(error: Error, isFatal: Bool = false, _ callback: @escaping ((Error?) -> Void)) {
    track(AnalyticsError(originalError: error, isFatal: isFatal), callback)
  }

  public func track(
    time: TimeInterval,
    withCategory category: String,
    withVariable variable: String,
    withLabel label: String?,
    _ callback: @escaping ((Error?) -> Void)
  ) {
    track(AnalyticsTiming(time: time, category: category, variable: variable, label: label), callback)
  }
}
