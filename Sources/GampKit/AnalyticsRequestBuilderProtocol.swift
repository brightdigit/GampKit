import Foundation

public protocol AnalyticsRequestBuilderProtocol {
  func request<SessionType: Session, RequestType>(
    forSession session: SessionType,
    withParameters parameters: AnalyticsParameterDictionary
  ) -> RequestType where SessionType.RequestType == RequestType
}
