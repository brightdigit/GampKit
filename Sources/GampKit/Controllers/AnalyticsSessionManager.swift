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

public struct AnalyticsSessionManager<SessionType : Session>: AnalyticsSessionManagerProtocol {
  public let session: SessionType
  public let requestBuilder: AnalyticsRequestBuilderProtocol

//  #warning("Remove static function")
//  public static func createSession(
//    withDelegate delegate: URLSessionDelegate? = nil,
//    inQueue queue: OperationQueue? = nil,
//    withUserAgent userAgent: String? = nil
//  ) -> URLSession {
//    let configuration = URLSessionConfiguration.ephemeral
//    configuration.httpMaximumConnectionsPerHost = 1
//    if let userAgent = userAgent {
//      configuration.httpAdditionalHeaders = ["User-Agent": userAgent]
//    }
//    return URLSession(configuration: configuration, delegate: delegate, delegateQueue: queue)
//  }

  public init(session: SessionType, requestBuilder: AnalyticsRequestBuilderProtocol? = nil) {
    self.session = session
    self.requestBuilder = requestBuilder ?? AnalyticsRequestBuilder()
  }

  public func send(_ parameters: AnalyticsParameterDictionary, _ callback: @escaping ((Error?) -> Void)) {
    let request = requestBuilder.request(forSession: self.session, withParameters: parameters)
    session.begin(request: request, callback)
//    let dataTask = session.dataTask(with: request, completionHandler: { data, _, _ in
//      if let data = data {
//        #if DEBUG
//          if let text = String(data: data, encoding: .utf8) {
//            debugPrint(text)
//          }
//        #endif
//      }
//      callback(nil)
//    })
//
//    dataTask.resume()
  }
}
