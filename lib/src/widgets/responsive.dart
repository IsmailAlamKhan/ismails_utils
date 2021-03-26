import 'package:flutter/material.dart';
import '../src.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({
    Key? key,
    required this.builder,
  }) : super(key: key);
  final ResponsiveWidget builder;
  @override
  Widget build(BuildContext context) {
    final controller = ScreenUtil(context);
    return builder(
      controller.screenSize,
      controller,
      controller.dp,
      controller.dpText,
      controller.pixelRation,
    );
  }
}
