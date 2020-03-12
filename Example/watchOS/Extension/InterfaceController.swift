import Foundation
import GampKit
import WatchKit

class TableRow: NSObject {
  @IBOutlet var label: WKInterfaceLabel!
  private(set) var isEnabled = true
  func setEnabled(_ enabled: Bool) {
    isEnabled = enabled
    DispatchQueue.main.async {
      self.label.setAlpha(enabled ? 1.0 : 0.5)
    }
  }
}

struct TableRowData {
  let labelText: String
  let action: (WKInterfaceTable, Int) -> Void
}

struct CustomError: LocalizedError {
  let localizedDescription: String
}

class InterfaceController: WKInterfaceController {
  @IBOutlet var table: WKInterfaceTable!

  static let tracker = AnalyticsTracker(configuration: AnalyticsConfiguration(
    trackingIdentifier: "UA-33667276-18",
    applicationName: "GampKitDemo",
    applicationVersion: "1.0",
    clientIdentifier: UUID()
  ))
  static var startTiming: Date?
  let rowActions: [TableRowData] = [
    TableRowData(labelText: "Track Event", action: trackEvent(fromTable:didSelectRowAt:)),
    TableRowData(labelText: "Start Timer", action: trackTiming(fromTable:didSelectRowAt:)),
    TableRowData(labelText: "Track Exception", action: trackException(fromTable:didSelectRowAt:))
  ]
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)

    // Configure interface objects here.
    table.setNumberOfRows(rowActions.count, withRowType: "row")

    for (index, data) in rowActions.enumerated() {
      guard let rowController = table.rowController(at: index) as? TableRow else {
        continue
      }

      rowController.label.setText(data.labelText)
    }
  }

  override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
    guard rowIndex < rowActions.count else {
      return
    }

    guard let rowController = table.rowController(at: rowIndex) as? TableRow else {
      return
    }

    guard rowController.isEnabled else {
      return
    }

    rowActions[rowIndex].action(table, rowIndex)
  }

  static func trackEvent(fromTable _: WKInterfaceTable, didSelectRowAt _: Int) {
    let event = AnalyticsEvent(category: "category", action: "action")
    tracker.track(event) { result in
      if case let .failure(error) = result {
        debugPrint(error)
      }
    }
  }

  static func trackTiming(fromTable table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
    guard let rowController = table.rowController(at: rowIndex) as? TableRow else {
      return
    }
    guard let timing = startTiming?.timeIntervalSinceNow else {
      startTiming = Date()
      DispatchQueue.main.async {
        rowController.label.setText("Track Timing")
      }
      return
    }
    rowController.setEnabled(false)
    tracker.track(time: -timing, withCategory: "testCategory", withVariable: "testVariable") { result in
      if case let .failure(error) = result {
        debugPrint(error)
      }
      DispatchQueue.main.async {
        rowController.setEnabled(false)
        rowController.label.setText("Start Timer")
      }
      self.startTiming = nil
    }
  }

  static func trackException(fromTable _: WKInterfaceTable, didSelectRowAt _: Int) {
    tracker.track(error: CustomError(localizedDescription: "custom error")) { result in

      if case let .failure(error) = result {
        debugPrint(error)
      }
    }
  }

  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }

  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
}
