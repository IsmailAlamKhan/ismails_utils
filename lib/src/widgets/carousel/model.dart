import 'package:flutter/material.dart';

class IsmailCarouselIndicatorCustomizer {
  final Color activeColor, inActiveColor;
  final IndexedWidgetBuilder? builder;
  late final double height, width, activeWidth;
  final Duration animationDuration;
  final BorderRadius borderRadius;
  final IsmailCarouselPosition position;

  IsmailCarouselIndicatorCustomizer({
    required this.activeColor,
    required this.inActiveColor,
    this.builder,
    this.height = 40,
    double? activeWidth,
    double? width,
    Duration? animationDuration,
    BorderRadius? borderRadius,
    IsmailCarouselPosition? position,
  })  : width = width ?? height,
        animationDuration = animationDuration ??
            const Duration(
              milliseconds: 300,
            ),
        borderRadius = borderRadius ?? BorderRadius.circular(50),
        position = position ??
            const IsmailCarouselPosition(
              bottom: 10,
              left: 0,
              right: 0,
            ) {
    this.activeWidth = activeWidth ?? (this.width * 3);
  }
}

class IsmailCarouselPosition {
  final double? top;
  final double? bottom;
  final double? right;
  final double? left;
  const IsmailCarouselPosition({this.top, this.bottom, this.right, this.left});
}
