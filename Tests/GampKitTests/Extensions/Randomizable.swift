protocol Randomizable {
  static func random() -> Self
}

extension String: Randomizable {
  static func random() -> String {
    random(ofLength: 255)
  }
}

extension Optional: Randomizable where Wrapped: Randomizable {
  static func random() -> Wrapped? {
    Bool.random() ? .none : .some(.random())
  }
}
