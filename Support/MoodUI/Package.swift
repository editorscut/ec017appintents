// swift-tools-version: 6.2

import PackageDescription

let package = Package(
  name: "MoodUI",
  platforms: [.iOS(.v26), .macOS(.v26)],
  products: [
    .library(
      name: "MoodUI",
      targets: ["MoodUI"]
    ),
  ],
  dependencies: [.package(path: "../MoodModel")],
  targets: [
    .target(
      name: "MoodUI",
      dependencies: ["MoodModel"],
      swiftSettings: [
        .defaultIsolation(MainActor.self),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault")
      ],
    ),
  ]
)
