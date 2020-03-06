public struct AnalyticsEvent: AnalyticsEventProtocol {
  public let category: String
  public let action: String
  public let label: String?
  public let value: Int?

  public init(
    category: String,
    action: String,
    label: String? = nil,
    value: Int? = nil
  ) {
    self.category = category
    self.action = action
    self.label = label
    self.value = value
  }
}
