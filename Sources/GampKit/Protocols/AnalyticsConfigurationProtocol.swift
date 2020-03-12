import Foundation

/**
 Static configuration to use for tracking the application.
 */
public protocol AnalyticsConfigurationProtocol: AnalyticsParameterable {
  /**
   Application version.
   */
  var applicationVersion: String { get }
  /**
   Application name.
   */
  var applicationName: String { get }
  /**
   Tracking identifier for Google Analytics.
   */
  var trackingIdentifier: String { get }
  /**
   Anonymous client identifier for Google Analytics.
   */
  var clientIdentifier: UUID { get }
  /**
   Static version number. `1`
   */
  var version: Int { get }
  /**
   (Optional) User language.
   */
  var userLanguage: String? { get }
  /**
   (Optional) Custom parameters to attach to all tracking info.
   */
  var customParameters: AnalyticsParameterDictionary { get }
}

public extension AnalyticsConfigurationProtocol {
  /**
   Creates a parameter dictionary based on the properties of the value.
   */
  func parameters() -> AnalyticsParameterDictionary {
    var dictionary = customParameters

    let mainParameters: AnalyticsParameterDictionary = [
      .trackingId: trackingIdentifier,
      .clientId: clientIdentifier,
      .version: version,
      .applicationName: applicationName,
      .applicationVersion: applicationVersion
    ]
    mainParameters.forEach {
      dictionary[$0.0] = $0.1
    }

    if let userLanguage = self.userLanguage {
      dictionary[.userLanguage] = userLanguage
    }

    return dictionary
  }
}
