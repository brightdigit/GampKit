![Logo of the project](https://raw.githubusercontent.com/jehna/readme-best-practices/master/sample-logo.png)

# GampKit

[![SwiftPM](https://img.shields.io/badge/SPM-Linux%20%7C%20iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS-success?logo=swift)](https://swift.org)
[![Twitter](https://img.shields.io/badge/twitter-@brightdigit-blue.svg?style=flat)](http://twitter.com/brightdigit)
![GitHub](https://img.shields.io/github/license/brightdigit/GampKit)
![GitHub issues](https://img.shields.io/github/issues/brightdigit/GampKit)
[![Beerpay](https://img.shields.io/beerpay/brightdigit/GampKit.svg?maxAge=2592000)](https://beerpay.io/brightdigit/GampKit)

[![macOS](https://github.com/brightdigit/GampKit/workflows/macOS/badge.svg)](https://github.com/brightdigit/GampKit/actions?query=workflow%3AmacOS)
[![ubuntu](https://github.com/brightdigit/GampKit/workflows/ubuntu/badge.svg)](https://github.com/brightdigit/GampKit/actions?query=workflow%3Aubuntu)
[![Travis (.com)](https://img.shields.io/travis/com/brightdigit/GampKit?logo=travis)](https://travis-ci.com/brightdigit/GampKit)
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
pod 'GampKit', '~> 0.0.1'
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. GampKit does support its use on supported platforms.

Once you have your Swift package set up, adding GampKit as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/brightdigit/GampKit.git", .upToNextMajor(from: "0.0.1"))
]
```

## Usage

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

#### Timing

#### Errors and Exceptions

#### Custom Items

## Contributing

When you publish something open source, one of the greatest motivations is that
anyone can just jump in and start contributing to your project.

These paragraphs are meant to welcome those kind souls to feel that they are
needed. You should state something like:

"If you'd like to contribute, please fork the repository and use a feature
branch. Pull requests are warmly welcome."

If there's anything else the developer needs to know (e.g. the code style
guide), you should link it here. If there's a lot of things to take into
consideration, it is common to separate this section to its own file called
`CONTRIBUTING.md` (or similar). If so, you should say that it exists here.

## Links

Even though this information can be found inside the project on machine-readable
format like in a .json file, it's good to include a summary of most useful
links to humans using your project. You can include links like:

https://developers.google.com/analytics/devguides/collection/protocol/v1
- Project homepage: https://your.github.com/awesome-project/
- Repository: https://github.com/your/awesome-project/
- Issue tracker: https://github.com/your/awesome-project/issues
  - In case of sensitive bugs like security vulnerabilities, please contact
    my@email.com directly instead of using issue tracker. We value your effort
    to improve the security and privacy of this project!
- Related projects:
  - Your other project: https://github.com/your/other-project/
  - Someone else's project: https://github.com/someones/awesome-project/

## Donations 

## Licensing

One really important part: Give your project a proper license. Here you should
state what the license is and how to find the text version of the license.
Something like:

"The code in this project is licensed under MIT license."

## Code Documentation
[Documentation Here](/Documentation/Reference/README.md)
