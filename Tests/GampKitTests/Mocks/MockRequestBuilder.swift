import GampKit

struct MockRequestBuilder: AnalyticsRequestBuilderProtocol {
  let error: Error?
  func request<SessionType, RequestType>(
    forSession session: SessionType,
    withParameters _: AnalyticsParameterDictionary
  ) throws -> RequestType
    where SessionType: Session, RequestType == SessionType.RequestType {
    if let error = error {
      throw error
    }
    return session.request()
  }
}
