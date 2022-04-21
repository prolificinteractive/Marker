// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "Marker",
  platforms: [.iOS(.v8), .tvOS(.v9), .macOS(.v10_12)],
  products: [
    .library(
      name: "Marker",
      targets: ["Marker"]
    )
  ],
  targets: [
    .target(
      name: "Marker",
      path: "Marker/Marker"
    )
  ]
)
