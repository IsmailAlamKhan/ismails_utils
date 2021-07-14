import 'package:flutter/material.dart';

import '../src.dart';

/// A ResponsiveBuilder widget which gives you access to the [ScreenUtil] class
/// also the [BoxConstraints] of the [LayoutBuilder]
class ResponsiveBuilder extends StatelessWidget {
  /// A ResponsiveBuilder widget which gives you access to the [ScreenUtil] class
  /// also the [BoxConstraints] of the [LayoutBuilder]
  const ResponsiveBuilder({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  /// The builder that will return the widget
  final ResponsiveWidgetBuilder builder;

  /// this is the child that property which won't get rebuild when this widget
  /// rebuilds.
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    final controller = ScreenUtil.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return builder(context, controller, child, constraints);
      },
    );
  }
}
