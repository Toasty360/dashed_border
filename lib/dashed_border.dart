import 'dart:ui';

import 'package:flutter/material.dart';

enum BorderStyleEx { solid, dashed, dotted }

class DashedBorder extends BoxBorder {
  final Color color;
  final double width;
  final double dashLength;
  final double dashGap;
  final BorderRadius? borderRadius;
  final BorderStyleEx style;

  const DashedBorder({
    this.color = Colors.black,
    this.width = 1.0,
    this.dashLength = 6.0,
    this.dashGap = 3.0,
    this.borderRadius,
    this.style = BorderStyleEx.dashed,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(width);

  @override
  bool get isUniform => true;

  @override
  BorderSide get top => BorderSide(width: width, color: color);

  @override
  BorderSide get bottom => BorderSide(width: width, color: color);

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    Path path;

    if (shape == BoxShape.circle) {
      path = Path()..addOval(rect);
    } else {
      final BorderRadius radius =
          this.borderRadius ?? borderRadius ?? BorderRadius.zero;
      path = Path()..addRRect(radius.toRRect(rect));
    }

    switch (style) {
      case BorderStyleEx.solid:
        canvas.drawPath(path, paint);
        break;
      case BorderStyleEx.dashed:
        _drawDashedPath(canvas, path, paint);
        break;
      case BorderStyleEx.dotted:
        _drawDottedPath(canvas, path, paint);
        break;
    }
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    final PathMetrics metrics = path.computeMetrics();
    for (final PathMetric metric in metrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final double next = distance + dashLength;
        canvas.drawPath(
          metric.extractPath(distance, next.clamp(0.0, metric.length)),
          paint,
        );
        distance += dashLength + dashGap;
      }
    }
  }

  void _drawDottedPath(Canvas canvas, Path path, Paint paint) {
    final double dotLength = width * 1.5;
    final PathMetrics metrics = path.computeMetrics();

    for (final PathMetric metric in metrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final double next = distance + dotLength;
        canvas.drawPath(
          metric.extractPath(distance, next.clamp(0.0, metric.length)),
          paint,
        );
        distance += dotLength * 2; // Dot + gap of equal size
      }
    }
  }

  @override
  BoxBorder scale(double t) {
    return DashedBorder(
      color: Color.lerp(null, color, t) ?? color,
      width: width * t,
      dashLength: dashLength * t,
      dashGap: dashGap * t,
      borderRadius: _scaleBorderRadius(borderRadius, t),
      style: style,
    );
  }

  BorderRadius? _scaleBorderRadius(BorderRadius? borderRadius, double t) {
    if (borderRadius == null) return null;

    return BorderRadius.only(
      topLeft: Radius.elliptical(
        borderRadius.topLeft.x * t,
        borderRadius.topLeft.y * t,
      ),
      topRight: Radius.elliptical(
        borderRadius.topRight.x * t,
        borderRadius.topRight.y * t,
      ),
      bottomLeft: Radius.elliptical(
        borderRadius.bottomLeft.x * t,
        borderRadius.bottomLeft.y * t,
      ),
      bottomRight: Radius.elliptical(
        borderRadius.bottomRight.x * t,
        borderRadius.bottomRight.y * t,
      ),
    );
  }

  DashedBorder copyWith({
    Color? color,
    double? width,
    double? dashLength,
    double? dashGap,
    BorderRadius? borderRadius,
    BorderStyleEx? style,
  }) {
    return DashedBorder(
      color: color ?? this.color,
      width: width ?? this.width,
      dashLength: dashLength ?? this.dashLength,
      dashGap: dashGap ?? this.dashGap,
      borderRadius: borderRadius ?? this.borderRadius,
      style: style ?? this.style,
    );
  }

  static DashedBorder? lerp(DashedBorder? a, DashedBorder? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b!.scale(t) as DashedBorder;
    if (b == null) return a.scale(1.0 - t) as DashedBorder;

    if (t == 0.0) return a;
    if (t == 1.0) return b;

    return DashedBorder(
      color: Color.lerp(a.color, b.color, t)!,
      width: lerpDouble(a.width, b.width, t)!,
      dashLength: lerpDouble(a.dashLength, b.dashLength, t)!,
      dashGap: lerpDouble(a.dashGap, b.dashGap, t)!,
      borderRadius: BorderRadius.lerp(a.borderRadius, b.borderRadius, t),
      style: t < 0.5 ? a.style : b.style,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;

    return other is DashedBorder &&
        other.color == color &&
        other.width == width &&
        other.dashLength == dashLength &&
        other.dashGap == dashGap &&
        other.borderRadius == borderRadius &&
        other.style == style;
  }

  @override
  int get hashCode =>
      Object.hash(color, width, dashLength, dashGap, borderRadius, style);

  @override
  String toString() {
    return 'DashedBorder('
        'color: $color, '
        'width: $width, '
        'dashLength: $dashLength, '
        'dashGap: $dashGap, '
        'borderRadius: $borderRadius, '
        'style: $style)';
  }
}
