import 'package:flutter/material.dart';

import '../src.dart';

/// Base Class of the animated widgets I provided
/// This takes Animation<double> to do the animation
/// provides a progress variable which will give the correct animation
/// whether you choose reverse or not.
abstract class IsmailAnimatedWidget extends AnimatedWidget {
  final Animation<double> animation;
  final bool isReverse;
  const IsmailAnimatedWidget({required this.animation, this.isReverse = false})
      : super(listenable: animation);

  Animation<double> get progress {
    final _animation = listenable as Animation<double>;
    if (isReverse) {
      return ReverseAnimation(_animation);
    }
    return _animation;
  }

  @override
  Widget build(BuildContext context);
}

class FadeSlideTransition extends IsmailAnimatedWidget {
  /// Creates  a transition with Fade with and Slide
  /// if you want a reversed transition use isReverseTrue or the
  /// [FadeSlideTransition.reverse] constructor
  const FadeSlideTransition({
    required Animation<double> animation,
    bool isReverse = false,
    required this.slide,
    required this.child,
  }) : super(animation: animation, isReverse: isReverse);
  const FadeSlideTransition.reverse({
    required Animation<double> animation,
    required this.slide,
    required this.child,
  }) : super(animation: animation, isReverse: true);

  /// The slide that you want for the animation an example would be
  /// ```
  ///   Tween(
  ///     begin: Offset(1,0),
  ///     end: Offset.zero,
  ///   )
  /// ```
  final Tween<Offset> slide;

  final Widget child;

  Animation<double> get _opacity => CurvedAnimation(
        parent: progress,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.easeInOut,
        ),
      );

  Animation<Offset> get _position => slide.animate(
        CurvedAnimation(
          parent: progress,
          curve: const Interval(
            0.0,
            0.8,
            curve: Curves.easeInOut,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _position,
        child: child,
      ),
    );
  }
}

class FadeSizeTransition extends AnimatedWidget {
  /// Creates a transition which Fades in and out also Size the animates
  const FadeSizeTransition({
    required this.animation,
    required this.child,
    this.axisAlignment = 0.0,
    this.isReverse = false,
    this.axis = Axis.vertical,
  }) : super(listenable: animation);

  /// This is the animaition that you will give its non-nullable
  final Animation<double> animation;
  final Widget child;

  /// defaults to 0.0, which centers the child along the main axis during the
  /// transition.
  final double axisAlignment;

  /// if this this is true the animation will be reversed.
  /// So if the value is 1.0 the animation will be at stoppped state
  /// and vice versa
  final bool isReverse;

  /// [Axis.horizontal] if [sizeFactor] modifies the width, otherwise
  /// [Axis.vertical].
  final Axis axis;

  Animation<double> get _progress {
    if (isReverse) {
      return ReverseAnimation(listenable as Animation<double>);
    }
    return listenable as Animation<double>;
  }

  /// This the opacity that is used on the FadeTransition
  Animation<double> get _opacity {
    return CurvedAnimation(
      parent: _progress,
      curve: const Interval(
        0.0,
        0.5,
        curve: Curves.easeInOut,
      ),
    );
  }

  /// This the sizeFactor that is used on the SizeTransition
  Animation<double> get _sizeFactor => CurvedAnimation(
        parent: _progress,
        curve: Curves.easeInOut,
      );

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SizeTransition(
        axis: axis,
        axisAlignment: axisAlignment,
        sizeFactor: _sizeFactor,
        child: child,
      ),
    );
  }
}

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
