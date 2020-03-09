import Foundation

public struct AnalyticsTiming: AnalyticsTimingProtocol {
  public let time: TimeInterval

  public let category: String

  public let variable: String

  public let label: String?
}
