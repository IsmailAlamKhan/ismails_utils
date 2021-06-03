import 'package:flutter/material.dart';

abstract class AnimationControllerState<T extends StatefulWidget>
    extends State<T> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  final duration = const Duration(milliseconds: 500);
  final reverseDuration = const Duration(milliseconds: 500);
  double? value;
  final lowerBound = 0.0;
  final upperBound = 1.0;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: duration,
      reverseDuration: reverseDuration,
      value: value,
      lowerBound: lowerBound,
      upperBound: upperBound,
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
