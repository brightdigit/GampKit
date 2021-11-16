import Foundation
import GampKit

struct MockParameterEncoder: AnalyticsParameterEncoderProtocol {
  let error: Error?
  let encoder = JSONEncoder()
  func encode(parameters: AnalyticsParameterDictionary) throws -> Data {
    if let error = error {
      throw error
    } else {
      return try encoder.encode(parameters.mapValues {
        String(describing: $0)
      })
    }
  }
}
