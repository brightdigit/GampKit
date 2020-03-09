
let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

extension String {
  static func random (withLength length: Int? = nil) -> Self {
    let word = letters.shuffled()
    guard let length = length else {
      return String(word)
    }
    return String(word[0...length-1])
  }
}
