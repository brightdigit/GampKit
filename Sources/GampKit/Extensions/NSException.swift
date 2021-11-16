import Foundation

#if !os(Linux)
  extension NSException: AnalyticsExceptionProtocol, Error {
    public var error: Error {
      self
    }

    public var isFatal: Bool {
      true
    }
  }
#endif
