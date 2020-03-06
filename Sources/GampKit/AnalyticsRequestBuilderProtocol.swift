import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public protocol AnalyticsRequestBuilderProtocol {
  func request(withParameters parameters: AnalyticsParameterDictionary) -> URLRequest
}
