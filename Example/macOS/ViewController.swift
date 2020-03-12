import Cocoa
import GampKit

struct CustomError: LocalizedError {
  let localizedDescription: String
}

class ViewController: NSViewController {
  let tracker = AnalyticsTracker(configuration: AnalyticsConfiguration(
    trackingIdentifier: "UA-33667276-18",
    applicationName: "GampKitDemo",
    applicationVersion: "1.0",
    clientIdentifier: UUID()
  ))

  var startTiming: Date?

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do view setup here.
  }

  @IBAction func trackEvent(withButton _: NSButton) {
    let event = AnalyticsEvent(category: "category", action: "action")
    tracker.track(event) { result in
      if case let .failure(error) = result {
        debugPrint(error)
      }
    }
  }

  @IBAction func trackTiming(withButton button: NSButton) {
    guard let timing = startTiming?.timeIntervalSinceNow else {
      startTiming = Date()
      DispatchQueue.main.async {
        button.title = "Track Timing"
      }
      return
    }
    button.isEnabled = false
    tracker.track(time: -timing, withCategory: "testCategory", withVariable: "testVariable") { result in
      if case let .failure(error) = result {
        debugPrint(error)
      }
      DispatchQueue.main.async {
        button.isEnabled = true
        button.title = "Start Timing"
      }
      self.startTiming = nil
    }
  }

  @IBAction func trackException(withButton _: NSButton) {
    tracker.track(error: CustomError(localizedDescription: "custom error")) { result in

      if case let .failure(error) = result {
        debugPrint(error)
      }
    }
  }
}
