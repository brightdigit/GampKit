public struct AnalyticsException: AnalyticsExceptionProtocol {
  public let error: Error
  public let isFatal: Bool
}
