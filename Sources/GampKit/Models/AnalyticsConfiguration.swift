//
//  AnalyticsConfiguration.swift
//  speculid
//
//  Created by Leo Dion on 10/17/16.
//
//
import Foundation

/**
 Static configuration to use for tracking the application.
 */
public struct AnalyticsConfiguration: AnalyticsConfigurationProtocol {
  /**
   Static version number. `1`
   */
  public let version = 1

  /**
   Tracking identifier for Google Analytics.
   */
  public let trackingIdentifier: String

  /**
   Anonymous client identifier for Google Analytics.
   */
  public let clientIdentifier: String

  /**
   Application name.
   */
  public let applicationName: String

  /**
   Application version.
   */
  public let applicationVersion: String

  /**
   (Optional) User language.
   */
  public let userLanguage: String?

  /**
   (Optional) Custom parameters to attach to all tracking info.
   */
  public let customParameters: AnalyticsParameterDictionary

  /**
   Creates the URL Session to use for analytics.
   - Parameters:
     - trackingIdentifier: Tracking identifier for Google Analytics.
     - applicationName: Application name.
     - applicationVersion: Application version.
     - clientIdentifier: Anonymous client identifier for Google Analytics.
     - customParameters: (Optional) Custom parameters to attach to all tracking info.
     - userLanguage: (Optional) User language. Uses first preferred locale, if not set.
   */
  public init(
    trackingIdentifier: String,
    applicationName: String,
    applicationVersion: String,
    clientIdentifier: String,
    customParameters: AnalyticsParameterDictionary? = nil,
    userLanguage: String? = nil
  ) {
    self.trackingIdentifier = trackingIdentifier
    self.applicationVersion = applicationVersion
    self.applicationName = applicationName
    self.clientIdentifier = clientIdentifier
    self.userLanguage = userLanguage ?? Locale.preferredLanguages.first
    self.customParameters = customParameters ?? AnalyticsParameterDictionary()
  }
}
