//
//  AnalyticsConfiguration.swift
//  speculid
//
//  Created by Leo Dion on 10/17/16.
//
//
import Foundation

public struct AnalyticsConfiguration: AnalyticsConfigurationProtocol {
  public let version = 1
  public let trackingIdentifier: String
  public let clientIdentifier: String
  public let applicationName: String
  public let applicationVersion: String
  public let userLanguage: String?
  public let customParameters: AnalyticsParameterDictionary

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
