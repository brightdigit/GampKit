import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension URLRequest: Request {
  public var body: Data? {
    get {
      httpBody
    }
    set {
      httpBody = newValue
    }
  }
}
