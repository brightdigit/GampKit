public struct AnalyticsRequestBuilder: AnalyticsRequestBuilderProtocol {
  public let baseURL: URL
  public let parameterEncoder: AnalyticsParameterEncoderProtocol
  public let timeoutInterval: TimeInterval

  public init(baseURL: URL? = nil, parameterEncoder: AnalyticsParameterEncoderProtocol? = nil, timeoutInterval _: TimeInterval? = nil) {
    self.baseURL = baseURL ?? AnalyticsURLs.default
    self.parameterEncoder = parameterEncoder ?? AnalyticsParameterEncoder()
    timeoutInterval = 5.0
  }

  public func request(withParameters parameters: AnalyticsParameterDictionary) -> URLRequest {
    var request = URLRequest(url: baseURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeoutInterval)

    /*
     let parameterString = parameters.map {
       Self.parameterString(fromKey: $0.key, withValue: $0.value)
     }.joined(separator: "&")
     */
    request.httpBody = parameterEncoder.encode(parameters: parameters) // parameterString.data(using: .utf8)
    request.httpMethod = "POST"
    return request
  }
}
