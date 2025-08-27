# Changelog

All notable changes to the `dashed_border` package will be documented in this file.

## [1.0.0] - 08-26-2025

### Initial Development Release

**First version of the Dashed Border package with core functionality:**

**Features Implemented:**
- ✅ **Core Border Implementation**: Complete `BoxBorder` interface implementation
- ✅ **Multiple Border Styles**: Support for solid, dashed, and dotted borders via `BorderStyleEx` enum
- ✅ **Customizable Properties**:
  - `color`: Border color (default: `Colors.black`)
  - `width`: Border width (default: `1.0`)
  - `dashLength`: Length of dashes (default: `6.0`)
  - `dashGap`: Gap between dashes (default: `3.0`)
  - `borderRadius`: Optional border radius for rounded corners
  - `style`: Border style (default: `BorderStyleEx.dashed`)

- ✅ **Shape Support**: Works with both `BoxShape.rectangle` and `BoxShape.circle`
- ✅ **Animation Ready**: Includes `lerp` method for smooth transitions
- ✅ **Builder Pattern**: `copyWith` method for easy customization
- ✅ **Performance Optimized**: Efficient path computation and rendering

**Technical Implementation:**
- Extends `BoxBorder` class for native Flutter integration
- Uses `PathMetrics` for efficient dashed/dotted path computation
- Proper handling of border radius for all corner types
- GPU-accelerated rendering

**Initial API:**
- `DashedBorder` constructor with all customizable parameters
- `scale()` method for proportional scaling
- `lerp()` method for animations and transitions
- `copyWith()` method for property modifications
- Proper `equals`, `hashCode`, and `toString()` implementations

**Note:** This is an initial development release. The API is stable but may undergo minor changes based on community feedback.

---


## [1.0.1] - 08-26-2025

Updated Readme.md


## [1.0.0] - TBD

### Planned Stable Release

**Features to be added before stable release:**
- [ ] Asymmetric border radii support
- [ ] Custom dash pattern arrays for irregular patterns
- [ ] Gradient border support
- [ ] Comprehensive test suite
- [ ] Example app with interactive demo
- [ ] Additional performance optimizations

**Documentation:**
- [ ] Complete API documentation
- [ ] Advanced usage examples
- [ ] Performance best practices guide
- [ ] Migration guide from other border packages