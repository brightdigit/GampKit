/**
 The object can be stored as a parameter dictionary based on the properties of the value.
 */
public protocol AnalyticsParameterable {
  /**
   Creates a parameter dictionary based on the properties of the value.
   */
  func parameters() -> AnalyticsParameterDictionary
}
