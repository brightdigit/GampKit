![Logo of the project](https://raw.githubusercontent.com/brightdigit/GampKit/master/logo.png)

# GampKit

[![SwiftPM](https://img.shields.io/badge/SPM-Linux%20%7C%20iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS-success?logo=swift)](https://swift.org)
[![Twitter](https://img.shields.io/badge/twitter-@brightdigit-blue.svg?style=flat)](http://twitter.com/brightdigit)
![GitHub](https://img.shields.io/github/license/brightdigit/GampKit)
![GitHub issues](https://img.shields.io/github/issues/brightdigit/GampKit)
[![Beerpay](https://img.shields.io/beerpay/brightdigit/GampKit.svg)](https://beerpay.io/brightdigit/GampKit)

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/brightdigit/GampKit/GampKit?label=Actions&logo=github)
[![Travis (.com)](https://img.shields.io/travis/com/brightdigit/GampKit?logo=travis)](https://travis-ci.com/brightdigit/GampKit)
[![CircleCI](https://img.shields.io/circleci/build/github/brightdigit/GampKit?label=xenial&logo=circleci&token=609e569b2dd9e85f571b788f67a857a1b7905773)](https://circleci.com/gh/brightdigit/GampKit)
[![Bitrise](https://img.shields.io/bitrise/7b69b24b7c56684a?label=macOS&logo=bitrise&token=eOT7evPhInsR8U_JnSih_w)](https://app.bitrise.io/app/7b69b24b7c56684a)

[![Codecov](https://img.shields.io/codecov/c/github/brightdigit/GampKit)](https://codecov.io/gh/brightdigit/GampKit)
[![CodeFactor Grade](https://img.shields.io/codefactor/grade/github/brightdigit/GampKit)](https://www.codefactor.io/repository/github/brightdigit/GampKit)
[![codebeat badge](https://codebeat.co/badges/4f86fb90-f8de-40c5-ab63-e6069cde5002)](https://codebeat.co/projects/github-com-brightdigit-GampKit-master)
[![Code Climate maintainability](https://img.shields.io/codeclimate/maintainability/brightdigit/GampKit)](https://codeclimate.com/github/brightdigit/GampKit)
[![Code Climate technical debt](https://img.shields.io/codeclimate/tech-debt/brightdigit/GampKit?label=debt)](https://codeclimate.com/github/brightdigit/GampKit)
[![Code Climate issues](https://img.shields.io/codeclimate/issues/brightdigit/GampKit)](https://codeclimate.com/github/brightdigit/GampKit)

[![Version](https://img.shields.io/cocoapods/v/GampKit.svg?style=flat)](https://cocoapods.org/pods/GampKit)
[![License](https://img.shields.io/cocoapods/l/GampKit.svg?style=flat)](https://cocoapods.org/pods/GampKit)
[![Platform](https://img.shields.io/cocoapods/p/GampKit.svg?style=flat)](https://cocoapods.org/pods/GampKit)
![Cocoapods doc percentage](https://img.shields.io/cocoapods/metrics/doc-percent/GampKit)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)


> Using Google Analytics for Tracking Events, Timing, Errors and more

Rather than downloading large amounts of libraries framework in order to understand how your app is used, you can use this library for easy data. The library works directly with Google Analytics using their Measure Protocol API. See all your data right from the Google Analytics dashboard.

## Features

Included with this library is the ability to track:

- [x] Events with Custom Data
- [x] Timing of various operations
- [x] Swift Errors and NSExceptions
- [x] Custom actions such screens and transactions

## Reqirements

- iOS 8.0+ / macOS 10.9+ / tvOS 9.0+ / watchOS 2.0+ / Linux 
- Xcode 10.2+
- Swift 5+

## Installing 

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate GampKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'GampKit', '~> 0.1.0'
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. GampKit does support its use on supported platforms.

Once you have your Swift package set up, adding GampKit as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/brightdigit/GampKit.git", .upToNextMajor(from: "0.1.0"))
]
```

## Usage

### [API Documentation](/Documentation/Reference/README.md)

Before moving forward make sure to setup a property under your Google Analytics account. With your new property for your application, you will need your _tracking identifier_. Typically a _tracking identifier_ has a format of `UA-XXXXXXXXX-XX`. You will need the _tracking identifier_ as well as the:

- **Application Name**
- **Application Version**
- **Client Identifier** - this should be a ananymous UUID created on application installation and saved to future use on launch

### Configuration

In order to begin tracking, you will need to setup a `AnalyticsTracker` with the configuration of your application using a `AnalyticsConfiguration` object:

```swift
  let tracker = AnalyticsTracker(configuration: AnalyticsConfiguration(
    trackingIdentifier: "UA-XXXXXXXX-XX",
    applicationName: "GampKitDemo",
    applicationVersion: "1.0",
    clientIdentifier: clientIdentifer
  ))
```

Now that you have setup your `AnalyticsTracker`, let's being tracking events.

### Tracking

There are three types of tracking objects: Events, Timing, and Exceptions.

#### Events

For tracking events, you can create an `AnalyticsEvent` with a category and action:

```swift
    let event = AnalyticsEvent(category: "category", action: "action")
    tracker.track(event) { result in
      if case let .failure(error) = result {
        debugPrint(error)
      }
    }
```

You can read [more details about events on the Google Analytics Measurement Protocol documentation.](https://developers.google.com/analytics/devguides/collection/protocol/v1/devguide#event)

#### Timing

For tracking timing, you can create an `AnalyticsTiming` or use `AnalyticsTracker.track(time:...)` with a category and action:

```swift
    let start : Date
    ...
    let timing = start.timeIntervalSinceNow
    tracker.track(time: -timing, withCategory: "jsonLoader", withVariable: "load") { result in
      if case let .failure(error) = result {
        debugPrint(error)
      }
    }
```

You can read [more details about timing on the Google Analytics Measurement Protocol documentation.](https://developers.google.com/analytics/devguides/collection/protocol/v1/devguide#usertiming)

#### Errors and Exceptions

For tracking errors and exceptions, you can use `AnalyticsTracker.track(error:...)`:

```swift
    do {
      try doSomething()
    } catch let error {
      tracker.track(error: error, isFatal: false) { result in
        if case let .failure(error) = result {
          debugPrint(error)
        }
      }
    }
```

You can read [more details about events on the Google Analytics Measurement Protocol documentation.](https://developers.google.com/analytics/devguides/collection/protocol/v1/devguide#exception)

#### Custom Items

You can also track custom items by implementing `AnalyticsTrackable`. This requires the implmentation of two methods:

```swift
  var hitType: AnalyticsHitType {
    get
  }

  func parameters() -> AnalyticsParameterDictionary
```

An `AnalyticsParameterDictionary` is simply a dictionary with keys of type `AnalyticsParameterKey`.

```swift
public typealias AnalyticsParameterDictionary = [AnalyticsParameterKey: Any]

public enum AnalyticsParameterKey: String, CaseIterable {
  case hitType = "t", version = "v", trackingId = "tid",
    userTimingCategory = "utc", userTimingLabel = "utl", timing = "utt", clientId = "cid",
    userTimingVariable = "utv",
    applicationName = "an", applicationVersion = "av", eventAction = "ea",
    eventCategory = "ec", eventLabel = "el", eventValue = "ev",
    userLanguage = "ul", operatingSystemVersion = "cd1", model = "cd2",
    exceptionDescription = "exd", exceptionFatal = "exf"
}
```

The rules regarding what are required based on hit type and each parameter is located in the [Google Analytics Measurement Protocol Parameter Reference.](https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters)

### Debugging vs. Release

By default, the library will either use the Google Analytics Measurement Protocol API url for validation purposes or the actual url depending on whether the build is `DEBUG` or `RELEASE`. When using the validation server, no items will be actually be tracked only validated. You can override this in one of two ways:

1. Supply a custom URL for the AnalyticsSessionManager

  ```swift
    let tracker = AnalyticsTracker(configuration: AnalyticsConfiguration(
      trackingIdentifier: "UA-XXXXXXXX-XX",
      applicationName: "GampKitDemo",
      applicationVersion: "1.0",
      clientIdentifier: clientIdentifer
    ), sessionManager: AnalyticsURLSession(url : url))
  ```

2. Use the debug mode flag for using the validation server 

  ```swift
    let tracker = AnalyticsTracker(configuration: AnalyticsConfiguration(
      trackingIdentifier: "UA-XXXXXXXX-XX",
      applicationName: "GampKitDemo",
      applicationVersion: "1.0",
      clientIdentifier: clientIdentifer
    ), debugMode: false)
  ```

## Links

- Google Analytics Measurement Protocol API
  - https://developers.google.com/analytics/devguides/collection/protocol/v1
- Repository
  - https://github.com/brightdigit/GampKit/
- Issue tracker
  - https://github.com/brightdigit/GampKit/issues

## License

GampKit is released under the MIT license. [See LICENSE](https://github.com/brightdigit/GampKit/blob/master/LICENSE) for details.
