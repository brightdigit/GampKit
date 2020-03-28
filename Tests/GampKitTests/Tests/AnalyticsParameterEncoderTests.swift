import GampKit
import XCTest

final class AnalyticsParameterEncoderTests: XCTestCase {
  func testEncode() {
    let encoder = AnalyticsParameterEncoder()
    let dictionary = AnalyticsParameterDictionary.random()
    let data: Data
    do {
      data = try encoder.encode(parameters: dictionary)
    } catch {
      XCTFail(error.localizedDescription)
      return
    }
    guard let text = String(data: data, encoding: .utf8) else {
      XCTFail("Couldn't decode data into string.")
      return
    }

    let pairs = text.components(separatedBy: "&").map {
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
