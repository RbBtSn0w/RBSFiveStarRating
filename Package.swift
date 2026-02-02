// swift-tools-version: 5.9
import PackageDescription

let package = Package(
  name: "RBSFiveStarRating",
  defaultLocalization: "en",
  platforms: [
    .iOS(.v12)
  ],
  products: [
    .library(
      name: "RBSFiveStarRating",
      targets: ["RBSFiveStarRating"]
    )
  ],
  targets: [
    .target(
      name: "RBSFiveStarRating",
      path: "RBSFiveStarRating",
      sources: ["Classes"],
      resources: [
        .process("Assets")
      ],
      publicHeadersPath: "Classes"
    ),
    .testTarget(
      name: "RBSFiveStarRatingTests",
      dependencies: ["RBSFiveStarRating"],
      path: "Example/Tests",
      sources: ["Tests.m"]
    ),
  ]
)
