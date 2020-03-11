import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
  var window: NSWindow?

  func applicationDidFinishLaunching(_: Notification) {
    // Insert code here to tear down your application
    let viewController = ViewController(nibName: "ViewController", bundle: nil)
    let window = NSWindow(contentViewController: viewController)

    window.makeKeyAndOrderFront(self)

    self.window = window
  }

  func applicationWillTerminate(_: Notification) {
    // Insert code here to tear down your application
  }
}
