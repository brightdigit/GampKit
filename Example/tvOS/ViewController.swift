import GampKit
import UIKit

struct CustomError: LocalizedError {
  let localizedDescription: String
}

class ViewController: UIViewController {
  let tracker = AnalyticsTracker(configuration: AnalyticsConfiguration(
    trackingIdentifier: "UA-33667276-18",
    applicationName: "GampKitDemo",
    applicationVersion: "1.0",
    clientIdentifier: UUID().uuidString
  ))

  var startTiming: Date?

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  @IBAction func trackEvent(fromButton _: UIButton, withEvent event: UIEvent) {
    let event = AnalyticsEvent(category: "category", action: "action")
    tracker.track(event) { result in
      if case let .failure(error) = result {
        debugPrint(error)
      }
    }
  }

  @IBAction func trackTiming(fromButton button: UIButton, withEvent _: UIEvent) {
    guard let timing = startTiming?.timeIntervalSinceNow else {
      startTiming = Date()
      DispatchQueue.main.async {
        button.setTitle("Track Timing", for: .normal)
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
        button.setTitle("Start Timer", for: .normal)
      }
      self.startTiming = nil
    }
  }

  @IBAction func trackException(fromButton _: UIButton, withEvent _: UIEvent) {
    tracker.track(error: CustomError(localizedDescription: "custom error")) { result in

      if case let .failure(error) = result {
        debugPrint(error)
      }
    }
  }

  /*
   // MARK: - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // Get the new view controller using segue.destination.
       // Pass the selected object to the new view controller.
   }
   */
}
