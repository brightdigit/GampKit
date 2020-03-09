import GampKit

struct MockRequestBuilder: AnalyticsRequestBuilderProtocol {
  func request<SessionType, RequestType>(
    forSession session: SessionType,
    withParameters _: AnalyticsParameterDictionary
  ) -> RequestType where SessionType: Session, RequestType == SessionType.RequestType {
    return session.request(withURL: .random(), cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 5.0)
  }
}
