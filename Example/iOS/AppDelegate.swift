import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let window = UIWindow(frame: UIScreen.main.bounds)
    let storyboard = UIStoryboard(name: "Storyboard", bundle: Bundle.main)
    window.rootViewController = storyboard.instantiateInitialViewController()
    window.makeKeyAndVisible()
    self.window = window
    return true
  }

  // MARK: UISceneSession Lifecycle
}
