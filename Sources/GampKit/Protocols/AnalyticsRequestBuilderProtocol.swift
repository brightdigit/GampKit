import Foundation

public protocol AnalyticsRequestBuilderProtocol {
  func request<SessionType: Session, RequestType>(
    forSession session: SessionType,
    withParameters parameters: AnalyticsParameterDictionary
  ) throws -> RequestType where SessionType.RequestType == RequestType
}
