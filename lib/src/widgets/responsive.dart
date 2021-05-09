import 'package:flutter/material.dart';

import '../src.dart';

/// A ResponsiveBuilder widget which gives you access to the [ScreenUtil] class
/// also the [BoxConstraints] of the [LayoutBuilder]
class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  /// The builder that will return the widget
  final ResponsiveWidget builder;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final controller = ScreenUtil.of(context);
        return builder(context, controller, child, constraints);
      },
    );
  }
}
