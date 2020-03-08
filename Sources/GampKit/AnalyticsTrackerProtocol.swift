import Foundation

public protocol AnalyticsTrackerProtocol {
  func track(
    time: TimeInterval,
    withCategory category: String,
    withVariable variable: String,
    withLabel label: String?,
    _ callback: @escaping ((Error?) -> Void)
  )

  func track(event: AnalyticsEventProtocol, _ callback: @escaping ((Error?) -> Void))

  func track(error: Error, isFatal: Bool, _ callback: @escaping ((Error?) -> Void))
}

#if !os(Linux)
  public extension AnalyticsTrackerProtocol {
    func track(exception: NSException, _ callback: @escaping ((Error?) -> Void)) {
      track(error: exception, isFatal: true, callback)
    }
  }

  extension NSException: Error {}
#endif
