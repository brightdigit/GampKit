import Foundation
#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension URLSession: URLSessionable {
  public func dataTask(with request: URLRequest, _ completion: @escaping (AnalyticsResult) -> Void) -> URLSessionableDataTask {
    return dataTask(with: request) { data, response, error in
      #if DEBUG
        let text = data.flatMap { String(data: $0, encoding: .utf8) }
        let status = response.flatMap { $0 as? HTTPURLResponse }.map { $0.statusCode }
        if let status = status {
          debugPrint("Status Code", status)
        }
        if let text = text {
          debugPrint(text)
        }
      #endif
      completion(AnalyticsResult(error: error))
    }
  }
}
