import GampKit
import UIKit

class ViewController: UIViewController {
  let tracker = AnalyticsTracker(configuration: AnalyticsConfiguration(
    trackingIdentifier: "UA-33667276-18",
    applicationName: "GampKitDemo",
    applicationVersion: "1.0",
    clientIdentifier: UUID().uuidString
  ))

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  @IBAction func track(fromButton _: UIButton, withEvent event: UIEvent) {
    let event = AnalyticsEvent(category: "category", action: "action")
    tracker.track(event) { error in
      if let error = error {
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
