import 'package:flutter/material.dart';

import '../src.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);
  final ResponsiveWidget builder;

  @override
  Widget build(BuildContext context) {
    final controller = ScreenUtil.of(context);
    return builder(context, controller);
  }
}
