import Foundation

struct MockError: Error {
  let description: String
}

extension MockError: LocalizedError {
  var errorDescription: String? {
    return description
  }
}
