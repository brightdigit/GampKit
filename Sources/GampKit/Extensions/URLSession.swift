import Foundation
#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension URLSession: URLSessionable {
  public func dataTask(with request: URLRequest,
                       decodeWith decoder: AnalyticsResultDecoderProtocol,
                       _ completion: @escaping (AnalyticsResult) -> Void) -> URLSessionableDataTask {
    return dataTask(with: request) { data, _, error in
      if let error = error {
        completion(AnalyticsResult(error: error))
        return
      }
      guard let data = data else {
        completion(AnalyticsResult(error: error))
        return
      }
      completion(decoder.decode(data))
    }
  }
}
