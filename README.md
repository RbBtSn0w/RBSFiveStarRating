# RBSFiveStarRating

[![CI Status](https://img.shields.io/github/actions/workflow/status/RbBtSn0w/RBSFiveStarRating/ci.yml?branch=master)](https://github.com/RbBtSn0w/RBSFiveStarRating/actions)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/RbBtSn0w/RBSFiveStarRating/blob/master/LICENSE)
[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)](https://github.com/RbBtSn0w/RBSFiveStarRating)

A customizable five-star rating view component for iOS.

## Features

- ✨ Customizable rating images and breakpoints
- 🎨 Support for different rating states (no rating, zero rating, partial ratings, full rating)
- 📱 iOS 12.0+ support
- 🔧 Built with Tuist for modern iOS development

## Example

To run the example project:

```bash
# Install Tuist via Homebrew
brew install tuist

# Clone the repo
git clone https://github.com/RbBtSn0w/RBSFiveStarRating.git
cd RBSFiveStarRating

# Generate and open the project
tuist generate
```

## Requirements

- iOS 12.0+
- Xcode 14.0+

## Installation

### Swift Package Manager

To integrate RBSFiveStarRating into your Xcode project using Swift Package Manager, add it to the dependencies value of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/RbBtSn0w/RBSFiveStarRating.git", from: "1.0.0")
]
```

And add it to your target's dependencies:

```swift
targets: [
    .target(
        name: "YourTarget",
        dependencies: ["RBSFiveStarRating"]
    )
]
```

Or via Xcode:

1. File > Add Packages...
2. Search for `https://github.com/RbBtSn0w/RBSFiveStarRating.git`
3. Select "Up to Next Major Version" -> `1.0.0`

### Manual Installation

1. Download or clone the repository
2. Copy the `RBSFiveStarRating/Classes` and `RBSFiveStarRating/Assets` folders to your project
3. Add the files to your Xcode project

## Usage

```objective-c
#import <RBSFiveStarRating/RBSFiveStarRatingView.h>

// Create a rating view with default configuration
RBSFiveStarRatingView *ratingView = [[RBSFiveStarRatingView alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];

// Set the rating (0.0 to 5.0)
ratingView.rating = RBS_NSDecimalNumberByString(@"4.5");

// Add to your view
[self.view addSubview:ratingView];
```

## Development

This project uses [Tuist](https://tuist.io) for project generation and dependency management.

### Setup

```bash
# Install Tuist via Homebrew
brew install tuist

# Generate Xcode project
tuist generate
```

### Building

```bash
# Build the project
tuist build
```

### Testing

```bash
# Run tests
tuist test
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for details on how to contribute to this project.

## Author

RbBtSn0w, hamiltonsnow@gmail.com

## License

RBSFiveStarRating is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
