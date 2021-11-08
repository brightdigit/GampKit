public enum AnalyticsParameterKey: String, CaseIterable {
  case hitType = "t", version = "v", trackingId = "tid",
    userTimingCategory = "utc", userTimingLabel = "utl", timing = "utt", clientId = "cid",
    userTimingVariable = "utv",
    applicationName = "an", applicationVersion = "av", eventAction = "ea",
    eventCategory = "ec", eventLabel = "el", eventValue = "ev",
    userLanguage = "ul", customDimension1 = "cd1", customDimension2 = "cd2",
   customDimension3 = "cd3", customDimension4 = "cd4",
    exceptionDescription = "exd", exceptionFatal = "exf"
}
