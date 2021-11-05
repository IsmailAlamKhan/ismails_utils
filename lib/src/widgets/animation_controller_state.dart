import 'package:flutter/material.dart';

/// Have to initialize the [AnimationControllerMixin.animation] before using the
/// animation controller otherwise you are gonna get a late initialization error.
mixin AnimationControllerMixin<T extends StatefulWidget> on TickerProviderStateMixin<T> {
  late final AnimationController animation;
  final duration = const Duration(milliseconds: 500);
  final reverseDuration = const Duration(milliseconds: 500);
  double value = 0;
  final lowerBound = 0.0;
  final upperBound = 1.0;
  void initializeAnimationController([bool isUnbounded = false]) {
    if (isUnbounded) {
      animation = AnimationController(
        vsync: this,
        duration: duration,
        reverseDuration: reverseDuration,
        value: value,
        lowerBound: lowerBound,
        upperBound: upperBound,
      );
    } else {
      animation = AnimationController.unbounded(
        vsync: this,
        duration: duration,
        reverseDuration: reverseDuration,
        value: value,
      );
    }
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }
}

/// Initialzies the [AnimationControllerMixin.animation] with a normal [AnimationController]
/// and adds TickerProviderStateMixin to the State
abstract class AnimationControllerState<T extends StatefulWidget> extends State<T>
    with TickerProviderStateMixin<T>, AnimationControllerMixin<T> {
  @override
  void initState() {
    super.initState();
    initializeAnimationController();
  }
}

/// Initialzies the [AnimationControllerMixin.animation] with an [AnimationController.unbounded]
/// and adds TickerProviderStateMixin to the State
abstract class UnboundedAnimationController<T extends StatefulWidget> extends State<T>
    with TickerProviderStateMixin<T>, AnimationControllerMixin<T> {
  @override
  void initState() {
    super.initState();
    initializeAnimationController(true);
  }
}
