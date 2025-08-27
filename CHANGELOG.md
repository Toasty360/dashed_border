# Changelog

All notable changes to `dashed_border` will be documented in this file.


## [1.0.2]
### Changed
- Updated `README.md` and documentation examples.
- Added example.md

## [1.0.1]
### Changed
- Updated `README.md` and documentation examples.
- Minor documentation fixes and formatting improvements.

## [1.0.0]
### Added
- ✅ Core `BoxBorder` implementation.
- ✅ Support for `solid`, `dashed`, and `dotted` via `BorderStyleEx`.
- ✅ Customizable properties: `color`, `width`, `dashLength`, `dashGap`, `borderRadius`, `style`.
- ✅ Shape support: `BoxShape.rectangle` and `BoxShape.circle`.
- ✅ `lerp()` method for animations.
- ✅ `copyWith()` method and standard overrides (`==`, `hashCode`, `toString()`).
- ✅ Performance optimizations (path metrics-based dashed path generation).

### Technical notes
- Uses `PathMetrics` for dashed/dotted path computation.
- Proper handling of rounded corners for all corner types.
- GPU-accelerated rendering path.

## Unreleased / Planned
### Added (planned)
- [ ] Asymmetric border radii support
- [ ] Custom dash pattern arrays for irregular patterns
- [ ] Gradient border support
- [ ] Comprehensive test suite
- [ ] Example app with interactive demo
- [ ] Additional performance optimizations

### Documentation (planned)
- [ ] Complete API documentation
- [ ] Advanced usage examples
- [ ] Performance best practices guide
- [ ] Migration guide from other border packages
