import Foundation
import GampKit

struct MockParameterEncoder: AnalyticsParameterEncoderProtocol {
  let encoder = JSONEncoder()
  func encode(parameters: AnalyticsParameterDictionary) -> Data? {
    return try? encoder.encode(parameters.mapValues {
      String(describing: $0)
    })
  }
}
