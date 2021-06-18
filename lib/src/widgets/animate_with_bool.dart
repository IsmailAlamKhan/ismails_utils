import 'package:flutter/material.dart';
import '../src.dart';

typedef ControlAnimationWithConditionBuilder = Widget Function(
  BuildContext context,
  Widget? child,
  Animation<double> animation,
);

class ControlAnimationWithCondition extends StatefulWidget {
  const ControlAnimationWithCondition({
    Key? key,
    required this.builder,
    this.child,
    required this.condition,
    this.duration = const Duration(milliseconds: 500),
  }) : super(key: key);
  final ControlAnimationWithConditionBuilder builder;
  final Widget? child;
  final bool condition;
  final Duration duration;
  @override
  ControlAnimationWithConditionState createState() =>
      ControlAnimationWithConditionState();
}

class ControlAnimationWithConditionState
    extends AnimationControllerState<ControlAnimationWithCondition> {
  @override
  Duration get duration => widget.duration;
  @override
  Widget build(BuildContext context) {
    if (widget.condition) {
      animation.forward();
    } else {
      animation.reverse();
    }
    return AnimatedBuilder(
      builder: (context, child) => widget.builder(
        context,
        child,
        animation,
      ),
      animation: animation,
      child: widget.child,
    );
  }
}
