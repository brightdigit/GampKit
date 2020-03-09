import Foundation

public struct AnalyticsURLs {
  private init() {}
  static let release = URL(string: "https://www.google-analytics.com/collect")!
  static let debug = URL(string: "https://www.google-analytics.com/debug/collect")!
}

extension AnalyticsURLs {
  static var `default`: URL {
    #if DEBUG
      return debug
    #else
      return release
    #endif
  }
}
