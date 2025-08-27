Here's a comprehensive `README.md` file for your Dashed Border package:

```markdown
# Dashed Border

A Flutter package that provides customizable dashed, dotted, and solid borders for widgets with support for rounded corners.

## Features

- 🎨 **Multiple Border Styles**: Solid, dashed, and dotted border styles
- 🔧 **Fully Customizable**: Adjust color, width, dash length, gap size, and corner radius
- ⚡ **Performance Optimized**: Efficient path rendering for smooth performance
- 🎯 **Flutter Native**: Implements standard `BoxBorder` interface for seamless integration
- 🔄 **Animation Ready**: Includes `lerp` method for smooth transitions and animations
- 📱 **Circle Support**: Works with both rectangular and circular shapes

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  dashed_border: ^1.0.0
```

Then run:
```bash
flutter pub get
```

## Usage

### Import the Package

```dart
import 'package:dashed_border/dashed_border.dart';
```

### Basic Examples

#### Dashed Border
```dart
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    border: DashedBorder(
      color: Colors.blue,
      width: 2.0,
      dashLength: 8.0,
      dashGap: 4.0,
    ),
  ),
  child: Text('Dashed Border'),
)
```

#### Dotted Border
```dart
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    border: DashedBorder(
      color: Colors.red,
      width: 2.0,
      style: BorderStyleEx.dotted,
    ),
  ),
  child: Text('Dotted Border'),
)
```

#### Rounded Dashed Border
```dart
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    border: DashedBorder(
      color: Colors.green,
      width: 3.0,
      dashLength: 10.0,
      dashGap: 5.0,
      borderRadius: BorderRadius.circular(12.0),
    ),
  ),
  child: Text('Rounded Dashed Border'),
)
```

#### Solid Border (Alternative to Flutter's Border)
```dart
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    border: DashedBorder(
      color: Colors.purple,
      width: 2.0,
      style: BorderStyleEx.solid,
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
  child: Text('Solid Border'),
)
```

#### Circular Container with Dashed Border
```dart
Container(
  width: 100,
  height: 100,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: DashedBorder(
      color: Colors.orange,
      width: 3.0,
      dashLength: 12.0,
      dashGap: 6.0,
    ),
  ),
  child: Icon(Icons.favorite, color: Colors.orange),
)
```

## API Reference

### DashedBorder Constructor

```dart
const DashedBorder({
  this.color = Colors.black,
  this.width = 1.0,
  this.dashLength = 6.0,
  this.dashGap = 3.0,
  this.borderRadius,
  this.style = BorderStyleEx.dashed,
})
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `color` | `Color` | `Colors.black` | Border color |
| `width` | `double` | `1.0` | Border width |
| `dashLength` | `double` | `6.0` | Length of each dash (for dashed style) |
| `dashGap` | `double` | `3.0` | Gap between dashes (for dashed style) |
| `borderRadius` | `BorderRadius?` | `null` | Border radius for rounded corners |
| `style` | `BorderStyleEx` | `BorderStyleEx.dashed` | Border style (solid, dashed, dotted) |

### BorderStyleEx Enum

```dart
enum BorderStyleEx { solid, dashed, dotted }
```

## Advanced Usage

### Animation Example

```dart
AnimationController _controller;

@override
void initState() {
  super.initState();
  _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 2),
  )..repeat(reverse: true);
}

@override
Widget build(BuildContext context) {
  return AnimatedBuilder(
    animation: _controller,
    builder: (context, child) {
      return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: DashedBorder.lerp(
            DashedBorder(
              color: Colors.blue,
              width: 1.0,
              dashLength: 4.0,
            ),
            DashedBorder(
              color: Colors.red,
              width: 3.0,
              dashLength: 12.0,
            ),
            _controller.value,
          ),
        ),
        child: Text('Animated Border'),
      );
    },
  );
}
```

### Copy With Pattern

```dart
final baseBorder = DashedBorder(
  color: Colors.blue,
  width: 2.0,
  dashLength: 8.0,
);

final highlightedBorder = baseBorder.copyWith(
  color: Colors.red,
  width: 3.0,
);
```

## Performance Considerations

- For complex shapes with many dashes/dots, consider using simpler border radii
- The border is drawn on the GPU, making it efficient for most use cases
- Avoid extremely small dash patterns on large containers for best performance

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

If you encounter any issues or have feature requests, please file an issue on the GitHub repository.

---

Made with ❤️ for the Flutter community

