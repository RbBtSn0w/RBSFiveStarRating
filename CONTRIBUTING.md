# Contributing to RBSFiveStarRating

First off, thank you for considering contributing to RBSFiveStarRating! It's people like you that make RBSFiveStarRating such a great tool.

## Code of Conduct

This project and everyone participating in it is governed by our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the existing issues as you might find out that you don't need to create one. When you are creating a bug report, please include as many details as possible:

* **Use a clear and descriptive title** for the issue to identify the problem.
* **Describe the exact steps which reproduce the problem** in as many details as possible.
* **Provide specific examples to demonstrate the steps**.
* **Describe the behavior you observed after following the steps** and point out what exactly is the problem with that behavior.
* **Explain which behavior you expected to see instead and why.**
* **Include screenshots and animated GIFs** if possible.
* **Include details about your configuration and environment**:
  - iOS version
  - Xcode version
  - Device or Simulator being used

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, please include:

* **Use a clear and descriptive title** for the issue to identify the suggestion.
* **Provide a step-by-step description of the suggested enhancement** in as many details as possible.
* **Provide specific examples to demonstrate the steps** or provide code samples.
* **Describe the current behavior** and **explain which behavior you expected to see instead** and why.
* **Explain why this enhancement would be useful** to most RBSFiveStarRating users.

### Pull Requests

* Fill in the required template
* Follow the Objective-C style guide used in this project
* Include screenshots and animated GIFs in your pull request whenever possible
* End all files with a newline
* Write clear, concise commit messages

## Development Setup

This project uses [Tuist](https://tuist.io) for project generation and dependency management.

1. Fork the repository
2. Clone your fork: `git clone https://github.com/YOUR_USERNAME/RBSFiveStarRating.git`
3. Navigate to the project directory: `cd RBSFiveStarRating`
4. Install Mise (if not already installed): `curl https://mise.run | sh`
5. Install Tuist: `mise install tuist@latest`
6. Generate the Xcode project: `mise x tuist -- tuist generate`

The generated Xcode project will open automatically.

### Legacy CocoaPods Setup

If you prefer to use CocoaPods (legacy):

1. Navigate to the Example directory: `cd Example`
2. Install dependencies: `pod install`
3. Open the workspace: `open RBSFiveStarRating.xcworkspace`

## Running Tests

### Using Tuist (Recommended)

```bash
mise x tuist -- tuist test
```

Or using xcodebuild after generating the project:

```bash
mise x tuist -- tuist generate --no-open
xcodebuild test \
  -project RBSFiveStarRating.xcodeproj \
  -scheme RBSFiveStarRating-Tests \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 15,OS=latest'
```

### Using CocoaPods (Legacy)

```bash
cd Example
xcodebuild test \
  -workspace RBSFiveStarRating.xcworkspace \
  -scheme RBSFiveStarRating-Example \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 14,OS=latest'
```

## Coding Style

* Follow Apple's coding conventions for Objective-C
* Use meaningful variable and method names
* Add comments for complex logic
* Keep methods focused and concise
* Use proper memory management practices

## Commit Messages

* Use the present tense ("Add feature" not "Added feature")
* Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
* Limit the first line to 72 characters or less
* Reference issues and pull requests liberally after the first line

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
