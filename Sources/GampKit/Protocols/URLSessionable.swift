import Foundation
#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif
public protocol URLSessionable {
  func dataTask(with request: URLRequest, _ completion: @escaping (Error?) -> Void) -> URLSessionableDataTask
}
