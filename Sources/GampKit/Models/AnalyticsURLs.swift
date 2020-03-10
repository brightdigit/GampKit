import Foundation

/**
 Static struct for URL used for Google Analytics.
 */
public struct AnalyticsURLs {
  private init() {}
  /**
   Google Analytics URL for Release
   */
  static let release = URL(string: "https://www.google-analytics.com/collect")!
  /**
   Google Analytics URL for Debugging.
   */
  static let debug = URL(string: "https://www.google-analytics.com/debug/collect")!
}

extension AnalyticsURLs {
  /**
   Default Google Analytics URL.
   */
  static var `default`: URL {
    #if DEBUG
      return debug
    #else
      return release
    #endif
  }
}
