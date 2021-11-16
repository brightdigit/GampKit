import GampKit
import XCTest

extension AnalyticsResult {
  var errorString: String? {
    switch self {
    case let .failure(error):
      return (error as? MockError)?.description

    default:
      return nil
    }
  }
}

final class AnalyticsResultDecoderTests: XCTestCase {
  func testReleaseSuccess() {
    let decoder = AnalyticsResultDecoder()
    let data = Data([70] + (0 ... 35).map { _ in UInt8.random(in: 0 ... UInt8.max) })
    let result = decoder.decode(data)
    switch result {
    case .success(.none):
      return

    case let .failure(error):
      XCTFail(error.localizedDescription)

    default:
      XCTFail("Invalid Result \(result)")
    }
  }

  func testReleaseFailure() {
    let decoder = AnalyticsResultDecoder()
    let data = Data([123] + (0 ... 35).map { _ in UInt8.random(in: 0 ... UInt8.max) })
    let result = decoder.decode(data)
    switch result {
    case .failure:
      return

    default:
      XCTFail("Invalid Result \(result)")
    }
  }

  func testDebugFailure() {
    let decoder = AnalyticsResultDecoder()
    let data = Data([123] + (0 ... 35).map { _ in UInt8.random(in: 0 ... UInt8.max) })
    let result = decoder.decode(data)
    switch result {
    case .failure:
      return

    default:
      XCTFail("Invalid Result \(result)")
    }
  }

  func testDebugSuccess() {
    let jsonEncoder = JSONEncoder()
    let decoder = AnalyticsResultDecoder()
    let validation = AnalyticsValidation(
      hitParsingResult: [AnalyticsHitParsingResult(
        valid: true,
        hit: String.random(),
        parserMessage: [AnalyticsHitParserMessage(
          messageType: .info,
          description: String.random()
        )]
      )])
    let data: Data
    do {
      data = try jsonEncoder.encode(validation)
    } catch {
      XCTFail(error.localizedDescription)
      return
    }
    let result = decoder.decode(data)

    switch result {
    case let .success(.some(actual)):
      XCTAssertEqual(validation, actual)

    case let .failure(error):
      XCTFail(error.localizedDescription)

    default:
      XCTFail("Invalid Result \(result)")
    }
  }

  // swiftlint:disable:next function_body_length
  func testDecodeDataError() {
    let emptyData = Data([70] + (0 ... 35).map { _ in UInt8.random(in: 0 ... UInt8.max) })
    let error = MockError(description: String.random())
    let realData: Data
    let jsonEncoder = JSONEncoder()
    let decoder = AnalyticsResultDecoder()
    let validation = AnalyticsValidation(
      hitParsingResult: [AnalyticsHitParsingResult(
        valid: true,
        hit: String.random(),
        parserMessage: [AnalyticsHitParserMessage(
          messageType: .info,
          description: String.random()
        )]
      )])
    do {
      realData = try jsonEncoder.encode(validation)
    } catch {
      XCTFail(error.localizedDescription)
      return
    }

    XCTAssertEqual(decoder.decode(nil, error).errorString, error.description)
    XCTAssertEqual(decoder.decode(realData, error).errorString, error.description)
    XCTAssertEqual(decoder.decode(emptyData, error).errorString, error.description)
    XCTAssertEqual(try? decoder.decode(realData, nil).get(), validation)

    do {
      let optValidation = try decoder.decode(emptyData, nil).get()
      XCTAssertNil(optValidation)
    } catch {
      XCTFail(error.localizedDescription)
    }

    do {
      let optValidation = try decoder.decode(nil, nil).get()
      XCTAssertNil(optValidation)
    } catch {
      XCTFail(error.localizedDescription)
    }
  }
}
