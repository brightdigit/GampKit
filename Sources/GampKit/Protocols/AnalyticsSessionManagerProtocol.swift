import Foundation

public protocol AnalyticsSessionManagerProtocol {
  func send(_ parameters: AnalyticsParameterDictionary, _ callback: @escaping ((Error?) -> Void))
}
