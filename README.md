# RBSFiveStarRating

[![CI Status](https://img.shields.io/github/actions/workflow/status/RbBtSn0w/RBSFiveStarRating/ci.yml?branch=master)](https://github.com/RbBtSn0w/RBSFiveStarRating/actions)
[![Version](https://img.shields.io/cocoapods/v/RBSFiveStarRating.svg?style=flat)](https://cocoapods.org/pods/RBSFiveStarRating)
[![License](https://img.shields.io/cocoapods/l/RBSFiveStarRating.svg?style=flat)](https://cocoapods.org/pods/RBSFiveStarRating)
[![Platform](https://img.shields.io/cocoapods/p/RBSFiveStarRating.svg?style=flat)](https://cocoapods.org/pods/RBSFiveStarRating)

A customizable five-star rating view component for iOS.

## Features

- ✨ Customizable rating images and breakpoints
- 🎨 Support for different rating states (no rating, zero rating, partial ratings, full rating)
- 📱 iOS 12.0+ support
- 🔧 Built with Tuist for modern iOS development

## Example

To run the example project:

### Using Tuist (Recommended)

```bash
# Install Mise (package manager)
curl https://mise.run | sh

# Install Tuist
mise install tuist@latest

# Clone the repo
git clone https://github.com/RbBtSn0w/RBSFiveStarRating.git
cd RBSFiveStarRating

# Generate and open the project
mise x tuist -- tuist generate
```

### Using CocoaPods (Legacy)

```bash
# Clone the repo
git clone https://github.com/RbBtSn0w/RBSFiveStarRating.git
cd RBSFiveStarRating/Example

# Install dependencies
pod install

# Open workspace
open RBSFiveStarRating.xcworkspace
```

## Requirements

- iOS 12.0+
- Xcode 14.0+

## Installation

### CocoaPods

RBSFiveStarRating is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'RBSFiveStarRating'
```

### Swift Package Manager

Coming soon!

## Usage

```objective-c
#import <RBSFiveStarRating/RBSFiveStartRatingView.h>

// Create a rating view with default configuration
RBSFiveStartRatingView *ratingView = [[RBSFiveStartRatingView alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];

// Set the rating (0.0 to 5.0)
ratingView.rating = RBS_NSDecimalNumberByString(@"4.5");

// Add to your view
[self.view addSubview:ratingView];
```

## Development

This project uses [Tuist](https://tuist.io) for project generation and dependency management.

### Setup

```bash
# Install Mise
curl https://mise.run | sh

# Install dependencies
mise install

# Generate Xcode project
mise x tuist -- tuist generate
```

### Building

```bash
# Build the project
mise x tuist -- tuist build
```

### Testing

```bash
# Run tests
mise x tuist -- tuist test
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for details on how to contribute to this project.

## Author

RbBtSn0w, hamiltonsnow@gmail.com

## License

RBSFiveStarRating is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
