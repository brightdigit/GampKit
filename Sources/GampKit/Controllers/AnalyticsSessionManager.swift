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

public struct AnalyticsSessionManager<SessionType: Session>: AnalyticsSessionManagerProtocol {
  public let session: SessionType
  public let requestBuilder: AnalyticsRequestBuilderProtocol

  public init(session: SessionType, requestBuilder: AnalyticsRequestBuilderProtocol? = nil) {
    self.session = session
    self.requestBuilder = requestBuilder ?? AnalyticsRequestBuilder()
  }

  public func send(_ parameters: AnalyticsParameterDictionary, _ callback: @escaping ((Error?) -> Void)) {
    do {
      let request = try requestBuilder.request(forSession: session, withParameters: parameters)
      session.begin(request: request, callback)
    } catch {
      callback(error)
      return
    }
  }
}
