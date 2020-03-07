@testable import GampKit
import XCTest

extension AnalyticsParameterDictionary {
  static func random() -> Self {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return AnalyticsParameterKey.allCases.reduce(AnalyticsParameterDictionary()) { (dictionary, key) -> AnalyticsParameterDictionary in
      var result = dictionary
      result[key] = Bool.random() ? Int.random(in: 1...100) : String(letters.shuffled())
      return result
    }
  }
}

final class AnalyticsParameterEncoderTests: XCTestCase {
  func testEncode() {
    let encoder = AnalyticsParameterEncoder()
    let dictionary = AnalyticsParameterDictionary.random()
    guard let data = encoder.encode(parameters: dictionary) else {
      XCTFail("No data from encoder.")
      return
    }
    guard let text = String(data: data, encoding: .utf8) else {
      XCTFail("Couldn't decode data into string.")
      return
    }
    
    let pairs = text.components(separatedBy: "&").map{
      $0.components(separatedBy: "=")
    }
    
    for pair in pairs {
      guard let keyString = pair.first, let valueString = pair.last, pair.count == 2 else {
        XCTFail("Invalid pair: \(pair)")
        continue
      }
      guard let key = AnalyticsParameterKey(rawValue: keyString) else {
        XCTFail("Invalid key: \(keyString)")
        continue
      }
      guard let value = dictionary[key] else {
        XCTFail("Invalid value: \(key)")
        continue
      }
      XCTAssertEqual(String(describing: value), valueString)
    }
  }
}
