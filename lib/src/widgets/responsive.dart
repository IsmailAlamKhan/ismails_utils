import 'package:flutter/material.dart';

import '../src.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);
  final ResponsiveWidget builder;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    final controller = ScreenUtil.of(context);
    return builder(context, controller, child);
  }
}
