/**
 Trackable analytics event.
 */
public struct AnalyticsEvent: AnalyticsEventProtocol {
  /**
   The event category.
   */
  public let category: String
  /**
   The event action.
   */
  public let action: String
  /**
   The event label.
   */
  public let label: String?
  /**
   The event value.
   */
  public let value: Int?

  /**
   Tracks the timed event.
   - Parameters:
     - category: The event category.
     - action: The event action.
     - label: The event label.
     - value: (Optional) The event value.
   */
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
