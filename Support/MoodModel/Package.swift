// swift-tools-version: 6.2

import PackageDescription

let package = Package(
  name: "MoodModel",
  platforms: [.iOS(.v26), .macOS(.v26)],
  products: [
    .library(
      name: "MoodModel",
      targets: ["MoodModel"]
    ),
  ],
  targets: [
    .target(
      name: "MoodModel",
      swiftSettings: [.enableUpcomingFeature("NonisolatedNonsendingByDefault")]
    ),
    
  ]
)
