import ProjectDescription

let project = Project(
  name: "RBSFiveStarRating",
  organizationName: "RbBtSn0w",
  settings: .settings(
    configurations: [
      .debug(name: "Debug"),
      .release(name: "Release"),
    ]
  ),
  targets: [
    // Main Framework Target
    .target(
      name: "RBSFiveStarRating",
      destinations: .iOS,
      product: .framework,
      bundleId: "com.rbbtsnow.RBSFiveStarRating",
      deploymentTargets: .iOS("12.0"),
      infoPlist: .default,
      sources: ["RBSFiveStarRating/Classes/**"],
      resources: ["RBSFiveStarRating/Assets/RBSFiveStarRating.xcassets"],
      headers: .headers(
        public: ["RBSFiveStarRating/Classes/**/*.h"]
      ),
      settings: .settings(
        base: [
          "GCC_PREFIX_HEADER": "Example/RBSFiveStarRating/RBSFiveStarRating-Prefix.pch"
        ]
      )
    ),

    // Example App Target
    .target(
      name: "RBSFiveStarRating-Example",
      destinations: .iOS,
      product: .app,
      bundleId: "com.rbbtsnow.RBSFiveStarRating-Example",
      deploymentTargets: .iOS("12.0"),
      infoPlist: .file(path: "Example/RBSFiveStarRating/RBSFiveStarRating-Info.plist"),
      sources: ["Example/RBSFiveStarRating/**/*.{h,m,swift}"],
      resources: [
        "Example/RBSFiveStarRating/**/*.{storyboard,xib,xcassets}",
        "Example/RBSFiveStarRating/**/*.lproj",
      ],
      dependencies: [
        .target(name: "RBSFiveStarRating")
      ],
      settings: .settings(
        base: [
          "GCC_PREFIX_HEADER": "Example/RBSFiveStarRating/RBSFiveStarRating-Prefix.pch"
        ]
      )
    ),

    // Test Target
    .target(
      name: "RBSFiveStarRating-Tests",
      destinations: .iOS,
      product: .unitTests,
      bundleId: "com.rbbtsnow.RBSFiveStarRating-Tests",
      deploymentTargets: .iOS("12.0"),
      infoPlist: .file(path: "Example/Tests/Tests-Info.plist"),
      sources: ["Example/Tests/**/*.{h,m,swift}"],
      dependencies: [
        .target(name: "RBSFiveStarRating-Example"),
      ],
      settings: .settings(
        base: [
          "GCC_PREFIX_HEADER": "Example/Tests/Tests-Prefix.pch"
        ]
      )
    ),
  ],
  schemes: [
    .scheme(
      name: "RBSFiveStarRating",
      shared: true,
      buildAction: .buildAction(targets: ["RBSFiveStarRating"]),
      testAction: .targets(
        ["RBSFiveStarRating-Tests"],
        configuration: .debug
      ),
      runAction: nil,
      archiveAction: .archiveAction(configuration: .release),
      profileAction: .profileAction(configuration: .release),
      analyzeAction: .analyzeAction(configuration: .debug)
    ),
    .scheme(
      name: "RBSFiveStarRating-Example",
      shared: true,
      buildAction: .buildAction(targets: ["RBSFiveStarRating-Example", "RBSFiveStarRating"]),
      testAction: .targets(
        ["RBSFiveStarRating-Tests"],
        configuration: .debug
      ),
      runAction: .runAction(configuration: .debug, executable: "RBSFiveStarRating-Example"),
      archiveAction: .archiveAction(configuration: .release),
      profileAction: .profileAction(configuration: .release),
      analyzeAction: .analyzeAction(configuration: .debug)
    ),
    .scheme(
      name: "RBSFiveStarRating-Tests",
      shared: true,
      buildAction: .buildAction(targets: [
        "RBSFiveStarRating-Tests", "RBSFiveStarRating-Example", "RBSFiveStarRating",
      ]),
      testAction: .targets(
        ["RBSFiveStarRating-Tests"],
        configuration: .debug
      ),
      runAction: nil,
      archiveAction: nil,
      profileAction: nil,
      analyzeAction: .analyzeAction(configuration: .debug)
    ),
  ]
)
