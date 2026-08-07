// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "SmaatoSDKAdaptersAdMob",
    // GoogleMobileAds >= 13.0.0 declares an iOS 13 floor.
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "SmaatoSDKAdaptersAdMob",
            targets: ["SmaatoSDKAdaptersAdMob"]
        )
    ],
    dependencies: [
        // Must point at the first SmaatoSDK release that ships without bundled
        // adapters (adapter-free Package.swift). Bump on every SDK release.
        .package(url: "https://github.com/vervegroup/Smaato-ios-sdk-standalone.git", exact: "23.2.1"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", from: "13.0.0")
    ],
    targets: [
        .target(
            name: "SmaatoSDKAdaptersAdMob",
            dependencies: [
                .product(name: "SmaatoSDK", package: "Smaato-ios-sdk-standalone"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
            ],
            path: "SmaatoSDKAdapters/AdMob",
            sources: [
                "Banner/SMAAdMobSmaatoBannerAdapter.m",
                "Interstitial/SMAAdMobSmaatoInterstitialAdapter.m",
                "Native/SMAAdMobSmaatoNativeAdapter.m",
                "RewardedVideo/SMAAdMobSmaatoRewardedVideoAdapter.m"
            ],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("Banner"),
                .headerSearchPath("Interstitial"),
                .headerSearchPath("Native"),
                .headerSearchPath("RewardedVideo")
            ]
        )
    ]
)
