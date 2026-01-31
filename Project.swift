import ProjectDescription

let project = Project(
    name: "RBSFiveStarRating",
    organizationName: "RbBtSn0w",
    settings: .settings(
        configurations: [
            .debug(name: "Debug"),
            .release(name: "Release")
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
            resources: ["RBSFiveStarRating/Assets/**"],
            headers: .headers(
                public: ["RBSFiveStarRating/Classes/**/*.h"]
            )
        ),
        
        // Example App Target
        .target(
            name: "RBSFiveStarRating-Example",
            destinations: .iOS,
            product: .app,
            bundleId: "org.cocoapods.demo.RBSFiveStarRating-Example",
            deploymentTargets: .iOS("12.0"),
            infoPlist: .file(path: "Example/RBSFiveStarRating/RBSFiveStarRating-Info.plist"),
            sources: ["Example/RBSFiveStarRating/**/*.{h,m,swift}"],
            resources: [
                "Example/RBSFiveStarRating/**/*.{storyboard,xib,xcassets,strings}",
                "Example/RBSFiveStarRating/**/*.lproj"
            ],
            dependencies: [
                .target(name: "RBSFiveStarRating")
            ]
        ),
        
        // Test Target
        .target(
            name: "RBSFiveStarRating-Tests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "org.cocoapods.demo.RBSFiveStarRating-Tests",
            deploymentTargets: .iOS("12.0"),
            infoPlist: .file(path: "Example/Tests/Tests-Info.plist"),
            sources: ["Example/Tests/**/*.{h,m,swift}"],
            dependencies: [
                .target(name: "RBSFiveStarRating"),
                .target(name: "RBSFiveStarRating-Example")
            ]
        )
    ],
    schemes: [
        .scheme(
            name: "RBSFiveStarRating-Example",
            shared: true,
            buildAction: .buildAction(targets: ["RBSFiveStarRating-Example"]),
            testAction: .targets(["RBSFiveStarRating-Tests"]),
            runAction: .runAction(configuration: .debug, executable: "RBSFiveStarRating-Example")
        ),
        .scheme(
            name: "RBSFiveStarRating-Tests",
            shared: true,
            buildAction: .buildAction(targets: ["RBSFiveStarRating-Tests"]),
            testAction: .targets(["RBSFiveStarRating-Tests"])
        )
    ]
)
