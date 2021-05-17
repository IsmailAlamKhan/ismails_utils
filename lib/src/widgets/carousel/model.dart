import 'package:flutter/material.dart';
import '../../src.dart';

typedef IsmailCarouselIndicatorBuilder = Widget Function(
  BuildContext context,
  int index,
  IsmailCarouselIndicatorCustomizer customizer,
  IsmaiLCarouselController controller,
);

class IsmailCarouselIndicatorCustomizer {
  final Color activeColor;
  final Color inActiveColor;
  final IsmailCarouselIndicatorBuilder? builder;
  late final double height;
  late final double width;
  late final double activeWidth;
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

  IsmailCarouselIndicatorCustomizer copyWith({
    Color? activeColor,
    Color? inActiveColor,
    IsmailCarouselIndicatorBuilder? builder,
    double? height,
    double? width,
    double? activeWidth,
    Duration? animationDuration,
    BorderRadius? borderRadius,
    IsmailCarouselPosition? position,
  }) {
    return IsmailCarouselIndicatorCustomizer(
      activeColor: activeColor ?? this.activeColor,
      inActiveColor: inActiveColor ?? this.inActiveColor,
      builder: builder ?? this.builder,
      height: height ?? this.height,
      width: width ?? this.width,
      activeWidth: activeWidth ?? this.activeWidth,
      animationDuration: animationDuration ?? this.animationDuration,
      borderRadius: borderRadius ?? this.borderRadius,
      position: position ?? this.position,
    );
  }
}

class IsmailCarouselPosition {
  final double? top;
  final double? bottom;
  final double? right;
  final double? left;
  const IsmailCarouselPosition({this.top, this.bottom, this.right, this.left});

  IsmailCarouselPosition copyWith({
    double? top,
    double? bottom,
    double? right,
    double? left,
  }) {
    return IsmailCarouselPosition(
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
      right: right,
      left: left ?? this.left,
    );
  }
}
