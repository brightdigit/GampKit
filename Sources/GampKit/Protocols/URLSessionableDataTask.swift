import Foundation
#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol URLSessionableDataTask {
  func resume()
}
