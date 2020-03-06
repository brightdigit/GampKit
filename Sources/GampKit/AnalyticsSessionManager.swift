//
//  AnalyticsSessionManager.swift
//  speculid
//
//  Created by Leo Dion on 10/17/16.
//
//
import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct AnalyticsSessionManager: AnalyticsSessionManagerProtocol {
  #warning("Allow this to be configurable")
  #if DEBUG
    public static let defaultBaseUrl = URL(string: "https://www.google-analytics.com/debug/collect")!
  #else
    public static let defaultBaseUrl = URL(string: "https://www.google-analytics.com/collect")!
  #endif

  #warning("use abstraction")
  public let baseUrl: URL
  public let timeoutInterval: TimeInterval = 5
  #warning("use abstraction")
  public let session: URLSession

  #warning("Remove static function")
  public static func createSession(
    withDelegate delegate: URLSessionDelegate? = nil,
    inQueue queue: OperationQueue? = nil,
    withUserAgent userAgent: String? = nil
  ) -> URLSession {
    let configuration = URLSessionConfiguration.ephemeral
    configuration.httpMaximumConnectionsPerHost = 1
    if let userAgent = userAgent {
      configuration.httpAdditionalHeaders = ["User-Agent": userAgent]
    }
    return URLSession(configuration: configuration, delegate: delegate, delegateQueue: queue)
  }

  public init(baseUrl: URL? = nil) {
    self.baseUrl = baseUrl ?? AnalyticsSessionManager.defaultBaseUrl
    session = AnalyticsSessionManager.createSession(withDelegate: nil, inQueue: nil, withUserAgent: nil)
  }

  #warning("Move to protocol")
  static func parameterString(fromKey key: AnalyticsParameterKey, withValue value: Any) -> String {
    "\(key.rawValue)=\(String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)"
  }

  #warning("Make asyncronous")
  public func send(_ parameters: AnalyticsParameterDictionary) {
    let semaphore = DispatchSemaphore(value: 0)
    var request = URLRequest(url: baseUrl, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeoutInterval)
    let parameterString = parameters.map {
      Self.parameterString(fromKey: $0.key, withValue: $0.value)
    }.joined(separator: "&")

    request.httpBody = parameterString.data(using: .utf8)
    request.httpMethod = "POST"

    let dataTask = session.dataTask(with: request, completionHandler: { data, _, _ in
      if let data = data {
        #if DEBUG
          if let text = String(data: data, encoding: .utf8) {
            debugPrint(text)
          }
        #endif
      }
      semaphore.signal()
    })

    dataTask.resume()
    semaphore.wait()
  }
}
