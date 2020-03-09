import Foundation
#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension URLSession: URLSessionable {
  public func dataTask(with request: URLRequest, _ completion: @escaping (Error?) -> Void) -> URLSessionableDataTask {
    return dataTask(with: request) { _, _, error in
      completion(error)
    }
  }
}
