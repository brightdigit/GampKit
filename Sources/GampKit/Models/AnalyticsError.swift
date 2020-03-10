public struct AnalyticsError: AnalyticsErrorProtocol {
  public let originalError: Error
  public let isFatal: Bool
}
