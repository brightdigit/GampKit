import Foundation

#if !os(Linux)
  extension NSException: AnalyticsErrorProtocol, Error {
    public var originalError: Error {
      return self
    }

    public var isFatal: Bool {
      return true
    }
  }
#endif
