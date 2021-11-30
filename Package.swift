// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "GampKit",
  products: [
    // Products define the executables and libraries produced by a package, and make them visible to other packages.
    .library(
      name: "GampKit",
      targets: ["GampKit"]
    )
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
    .package(url: "https://github.com/shibapm/Komondor", from: "1.1.2"), // dev
    .package(url: "https://github.com/eneko/SourceDocs", from: "1.2.1"), // dev
    .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.47.0"), // dev
    .package(url: "https://github.com/realm/SwiftLint", from: "0.43.0"), // dev
    .package(url: "https://github.com/shibapm/Rocket", from: "1.2.1"), // dev
    .package(url: "https://github.com/brightdigit/swift-test-codecov", from: "1.0.0") // dev
  ],
  targets: [
    .target(
      name: "GampKit",
      dependencies: []
    ),
    .testTarget(
      name: "GampKitTests",
      dependencies: ["GampKit"]
    )
  ]
)

#if canImport(PackageConfig)
  import PackageConfig

  let requiredCoverage: Int = 80

  let config = PackageConfiguration([
    "rocket": [
      "steps": [
        // ["hide_dev_dependencies": ["package_path": "Package@swift-5.5.swift"]],
        "hide_dev_dependencies",
        "git_add",
        ["commit": ["no_verify": true]],
        "tag",
        "unhide_dev_dependencies",
        // ["unhide_dev_dependencies": ["package_path": "Package@swift-5.5.swift"]],
        "git_add",
        ["commit": ["message": "Unhide dev dependencies"]]
      ]
    ],
    "komondor": [
      "pre-push": [
        "swift test --enable-code-coverage --enable-test-discovery",
        // swiftlint:disable:next line_length
        "swift run swift-test-codecov .build/debug/codecov/GampKit.json --minimum \(requiredCoverage)"
      ],
      "pre-commit": [
        "swift test --enable-code-coverage --enable-test-discovery --generate-linuxmain",
        "swift run swiftformat .",
        "swift run swiftlint autocorrect",
//      "swift run sourcedocs generate build --clean --reproducible-docs --all-modules",
        "git add .",
        "swift run swiftformat --lint .",
        "swift run swiftlint"
      ]
    ]
  ]).write()
#endif
