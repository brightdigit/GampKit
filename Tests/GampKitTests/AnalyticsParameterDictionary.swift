
import GampKit


extension AnalyticsParameterDictionary {
  static func random() -> Self {
    return AnalyticsParameterKey.allCases.reduce(AnalyticsParameterDictionary()) { (dictionary, key) -> AnalyticsParameterDictionary in
      var result = dictionary
      result[key] = Bool.random() ? Int.random(in: 1 ... 100) : String.random()
      return result
    }
  }
}
