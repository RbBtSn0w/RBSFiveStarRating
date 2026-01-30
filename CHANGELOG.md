# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- **Tuist support for modern iOS project management** - The project now uses Tuist for Xcode project generation and dependency management
- `.mise.toml` configuration for version management
- `Project.swift` manifest for Tuist project definition
- GitHub Actions CI/CD workflow for automated builds and tests using Tuist
- CHANGELOG.md for tracking version changes
- CONTRIBUTING.md with guidelines for contributors
- CODE_OF_CONDUCT.md for community standards
- Issue and pull request templates
- Enhanced documentation in README.md with Tuist setup instructions

### Changed
- **Primary build system migrated from CocoaPods to Tuist** - CocoaPods is still supported for legacy compatibility
- Updated Travis CI configuration to use modern Xcode version (14.2)
- Updated .gitignore to include Tuist-specific patterns
- Modernized project structure for better open source collaboration
- Updated minimum iOS deployment target to 12.0 for better compatibility

### Fixed
- Improved CI/CD pipeline reliability with Tuist-based builds

### Migration Notes
- **For new developers**: Use Tuist (recommended) - Install with `mise install tuist@latest` and run `mise x tuist -- tuist generate`
- **For existing developers**: CocoaPods setup still works but is considered legacy
- The generated Xcode project (`.xcodeproj`) is now ignored in git as Tuist generates it from `Project.swift`

## [0.1.0] - 2019-08-17

### Added
- Initial release of RBSFiveStarRating
- Five-star rating view component for iOS
- Customizable rating images and breakpoints
- Support for iOS 8.0+
- CocoaPods support

[Unreleased]: https://github.com/RbBtSn0w/RBSFiveStarRating/compare/0.1.0...HEAD
[0.1.0]: https://github.com/RbBtSn0w/RBSFiveStarRating/releases/tag/0.1.0
