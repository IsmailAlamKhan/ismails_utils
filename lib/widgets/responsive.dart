import 'package:flutter/material.dart';
import 'package:some_basic_utils/utils/utils.dart';

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
