@testable import GampKit
import XCTest




final class AnalyticsTrackerTests: XCTestCase {
  func testTime () {
    let trackExpectation = expectation(description: "track-time")
    let trackingIdentifier = String.random()
    let applicationName = String.random()
    let applicationVersion = String.random()
    let time = TimeInterval.random()
    let category = String.random()
    let variable = String.random()
    let label = String.random()
    let clientIdentifier = String.random()
    let userLanguage = "en-us"
    let config = AnalyticsConfiguration(trackingIdentifier: trackingIdentifier, applicationName: applicationName, applicationVersion: applicationVersion, clientIdentifier: clientIdentifier, customParameters: nil, userLanguage: userLanguage)
    let sessionManager = MockSessionManager()
    let tracker = AnalyticsTracker(configuration: config, sessionManager: sessionManager)
    tracker.track(time: time, withCategory: category, withVariable: variable, withLabel: label) { (error) in
      trackExpectation.fulfill()
    }
    waitForExpectations(timeout: 1000) { (error) in
      XCTAssertNil(error)
      guard let parameters = sessionManager.lastParameters else {
        XCTFail("No parameters sent")
        return
      }
      var keys = 0
      XCTAssertEqual(trackingIdentifier, parameters[.trackingId] as? String)
      keys += 1
      XCTAssertEqual(applicationName, parameters[.applicationName] as? String)
      keys += 1
      XCTAssertEqual(applicationVersion, parameters[.applicationVersion] as? String)
      keys += 1
      XCTAssertEqual(Int(round(time * 1000.0)), parameters[.timing] as? Int)
      keys += 1
      XCTAssertEqual(category, parameters[.userTimingCategory] as? String)
      keys += 1
      XCTAssertEqual(variable, parameters[.userTimingVariable] as? String)
      keys += 1
      XCTAssertEqual(label, parameters[.userTimingLabel] as? String)
      keys += 1
      XCTAssertEqual(AnalyticsHitType.timing, parameters[.hitType] as? AnalyticsHitType)
      keys += 1
      XCTAssertEqual(clientIdentifier, parameters[.clientId] as? String)
      keys += 1
      XCTAssertEqual(userLanguage, parameters[.userLanguage] as? String)
      keys += 1
      XCTAssertEqual(1, parameters[.version] as? Int)
      keys += 1
      XCTAssertEqual(keys, parameters.count)
      
    }
  }
  
  func testEvent () {
    let trackExpectation = expectation(description: "track-event")
    let trackingIdentifier = String.random()
    let applicationName = String.random()
    let applicationVersion = String.random()
    let value = Int.random()
    let category = String.random()
    let action = String.random()
    let label = String.random()
    let clientIdentifier = String.random()
    let userLanguage = "en-us"
    let config = AnalyticsConfiguration(trackingIdentifier: trackingIdentifier, applicationName: applicationName, applicationVersion: applicationVersion, clientIdentifier: clientIdentifier, customParameters: nil, userLanguage: userLanguage)
    let sessionManager = MockSessionManager()
    let tracker = AnalyticsTracker(configuration: config, sessionManager: sessionManager)
    tracker.track(AnalyticsEvent(category: category, action: action, label: label, value: value)) { (_) in
    trackExpectation.fulfill()
    }
    waitForExpectations(timeout: 1000) { (error) in
      XCTAssertNil(error)
      guard let parameters = sessionManager.lastParameters else {
        XCTFail("No parameters sent")
        return
      }
      var keys = 0
      XCTAssertEqual(trackingIdentifier, parameters[.trackingId] as? String)
      keys += 1
      XCTAssertEqual(applicationName, parameters[.applicationName] as? String)
      keys += 1
      XCTAssertEqual(applicationVersion, parameters[.applicationVersion] as? String)
      keys += 1
      XCTAssertEqual(value, parameters[.eventValue] as? Int)
      keys += 1
      XCTAssertEqual(category, parameters[.eventCategory] as? String)
      keys += 1
      XCTAssertEqual(action, parameters[.eventAction] as? String)
      keys += 1
      XCTAssertEqual(label, parameters[.eventLabel] as? String)
      keys += 1
      XCTAssertEqual(AnalyticsHitType.event, parameters[.hitType] as? AnalyticsHitType)
      keys += 1
      XCTAssertEqual(clientIdentifier, parameters[.clientId] as? String)
      keys += 1
      XCTAssertEqual(userLanguage, parameters[.userLanguage] as? String)
      keys += 1
      XCTAssertEqual(1, parameters[.version] as? Int)
      keys += 1
      XCTAssertEqual(keys, parameters.count)
      
    }
  }
  
  func testError () {
    let trackExpectation = expectation(description: "track-error")
    let trackingIdentifier = String.random()
    let applicationName = String.random()
    let applicationVersion = String.random()
    let exceptionDescription = String.random()
//    let value = Int.random()
//    let category = String.random()
//    let action = String.random()
//    let label = String.random()
    let clientIdentifier = String.random()
    let userLanguage = "en-us"
    let config = AnalyticsConfiguration(trackingIdentifier: trackingIdentifier, applicationName: applicationName, applicationVersion: applicationVersion, clientIdentifier: clientIdentifier, customParameters: nil, userLanguage: userLanguage)
    let sessionManager = MockSessionManager()
    let tracker = AnalyticsTracker(configuration: config, sessionManager: sessionManager)
    tracker.trackError( MockError(description: exceptionDescription)) { (_) in
    trackExpectation.fulfill()
    }

    waitForExpectations(timeout: 1000) { (error) in
      XCTAssertNil(error)
      guard let parameters = sessionManager.lastParameters else {
        XCTFail("No parameters sent")
        return
      }
      var keys = 0
      XCTAssertEqual(trackingIdentifier, parameters[.trackingId] as? String)
      keys += 1
      XCTAssertEqual(applicationName, parameters[.applicationName] as? String)
      keys += 1
      XCTAssertEqual(applicationVersion, parameters[.applicationVersion] as? String)
      keys += 1
      XCTAssertEqual(0, parameters[.exceptionFatal] as? Int)
      keys += 1
      XCTAssertEqual(exceptionDescription, parameters[.exceptionDescription] as? String)
      keys += 1
      XCTAssertEqual(AnalyticsHitType.exception, parameters[.hitType] as? AnalyticsHitType)
      keys += 1
      XCTAssertEqual(clientIdentifier, parameters[.clientId] as? String)
      keys += 1
      XCTAssertEqual(userLanguage, parameters[.userLanguage] as? String)
      keys += 1
      XCTAssertEqual(1, parameters[.version] as? Int)
      keys += 1
      XCTAssertEqual(keys, parameters.count)
      
    }
  }

  func testException () {
    #if os(Linux)
    
    #else
      let trackExpectation = expectation(description: "track-error")
      let trackingIdentifier = String.random()
      let applicationName = String.random()
      let applicationVersion = String.random()
      //let exceptionDescription = String.random()
  //    let value = Int.random()
  //    let category = String.random()
  //    let action = String.random()
  //    let label = String.random()
      let clientIdentifier = String.random()
      let userLanguage = "en-us"
    let exceptionName = NSExceptionName(String.random())
    let exceptionReason = String.random()
      let config = AnalyticsConfiguration(trackingIdentifier: trackingIdentifier, applicationName: applicationName, applicationVersion: applicationVersion, clientIdentifier: clientIdentifier, customParameters: nil, userLanguage: userLanguage)
      let sessionManager = MockSessionManager()
      let tracker = AnalyticsTracker(configuration: config, sessionManager: sessionManager)
    
    let nsException = NSException(name: exceptionName, reason: exceptionReason, userInfo: nil)
    tracker.track(nsException) { (_) in
      trackExpectation.fulfill()
      }

      waitForExpectations(timeout: 1000) { (error) in
        XCTAssertNil(error)
        guard let parameters = sessionManager.lastParameters else {
          XCTFail("No parameters sent")
          return
        }
        var keys = 0
        XCTAssertEqual(trackingIdentifier, parameters[.trackingId] as? String)
        keys += 1
        XCTAssertEqual(applicationName, parameters[.applicationName] as? String)
        keys += 1
        XCTAssertEqual(applicationVersion, parameters[.applicationVersion] as? String)
        keys += 1
        XCTAssertEqual(1, parameters[.exceptionFatal] as? Int)
        keys += 1
        XCTAssertEqual(nsException.localizedDescription, parameters[.exceptionDescription] as? String)
        keys += 1
        XCTAssertEqual(AnalyticsHitType.exception, parameters[.hitType] as? AnalyticsHitType)
        keys += 1
        XCTAssertEqual(clientIdentifier, parameters[.clientId] as? String)
        keys += 1
        XCTAssertEqual(userLanguage, parameters[.userLanguage] as? String)
        keys += 1
        XCTAssertEqual(1, parameters[.version] as? Int)
        keys += 1
        XCTAssertEqual(keys, parameters.count)
        
      }
    #endif
    }
}
