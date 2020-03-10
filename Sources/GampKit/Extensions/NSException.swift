import Foundation

#if !os(Linux)
  extension NSException: AnalyticsExceptionProtocol, Error {
    public var error: Error {
      return self
    }

    public var isFatal: Bool {
      return true
    }
  }
#endif
