import Foundation
#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/**
 A URLRequestDataTask.
 */
public protocol URLSessionableDataTask {
  /**
   Begins the data task execution.
   */
  func resume()
}
