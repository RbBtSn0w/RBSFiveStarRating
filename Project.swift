import ProjectDescription

let project = Project(
    name: "RBSFiveStarRating",
    organizationName: "RbBtSn0w",
    settings: .settings(
        base: [
            "IPHONEOS_DEPLOYMENT_TARGET": "12.0"
        ],
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
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen",
                    "UIMainStoryboardFile": "Main",
                    "UISupportedInterfaceOrientations": [
                        "UIInterfaceOrientationPortrait",
                        "UIInterfaceOrientationLandscapeLeft",
                        "UIInterfaceOrientationLandscapeRight"
                    ],
                    "UISupportedInterfaceOrientations~ipad": [
                        "UIInterfaceOrientationPortrait",
                        "UIInterfaceOrientationPortraitUpsideDown",
                        "UIInterfaceOrientationLandscapeLeft",
                        "UIInterfaceOrientationLandscapeRight"
                    ]
                ]
            ),
            sources: ["Example/RBSFiveStarRating/**/*.{h,m,swift}"],
            resources: [
                "Example/RBSFiveStarRating/**/*.{storyboard,xib,xcassets,strings}"
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
            infoPlist: .default,
            sources: ["Example/Tests/**/*.{h,m,swift}"],
            dependencies: [
                .target(name: "RBSFiveStarRating"),
                .target(name: "RBSFiveStarRating-Example")
            ]
        )
    ]
)
