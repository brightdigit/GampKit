import Foundation
#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension URLSession: URLSessionable {
  public func dataTask(with request: URLRequest,
                       decodeWith decoder: AnalyticsResultDecoderProtocol,
                       _ completion: @escaping (AnalyticsResult) -> Void) -> URLSessionableDataTask {
    dataTask(with: request) { data, _, error in
      completion(decoder.decode(data, error))
    }
  }
}
