public enum AnalyticsHitType: String, CustomStringConvertible {
  case timing, event, exception

  public var description: String {
    rawValue
  }
}
