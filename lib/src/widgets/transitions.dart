import 'package:flutter/material.dart';

/// Base Class of the animated widgets I provided
/// This takes Animation<double> to do the animation
/// provides a progress variable which will give the correct animation
/// whether you choose reverse or not.
abstract class IsmailAnimatedWidget extends AnimatedWidget {
  final Animation<double> animation;
  final bool isReverse;
  const IsmailAnimatedWidget(
      {Key? key, required this.animation, this.isReverse = false})
      : super(listenable: animation, key: key);

  Animation<double> get progress {
    final _animation = listenable as Animation<double>;
    if (isReverse) {
      return ReverseAnimation(_animation);
    }
    return _animation;
  }

  Animation<double> get opacity => CurvedAnimation(
        parent: progress,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.easeInOut,
        ),
      );

  @override
  Widget build(BuildContext context);
}

class FadeSlideTransition extends IsmailAnimatedWidget {
  /// Creates  a transition with Fade with and Slide
  /// if you want a reversed transition use isReverseTrue or the
  /// [FadeSlideTransition.reverse] constructor
  const FadeSlideTransition({
    Key? key,
    required Animation<double> animation,
    bool isReverse = false,
    required this.slide,
    required this.child,
  }) : super(key: key, animation: animation, isReverse: isReverse);
  const FadeSlideTransition.reverse({
    Key? key,
    required Animation<double> animation,
    required this.slide,
    required this.child,
  }) : super(key: key, animation: animation, isReverse: true);

  /// The slide that you want for the animation an example would be
  /// ```
  ///   Tween(
  ///     begin: Offset(1,0),
  ///     end: Offset.zero,
  ///   )
  /// ```
  final Tween<Offset> slide;

  final Widget child;

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
      opacity: opacity,
      child: SlideTransition(
        position: _position,
        child: child,
      ),
    );
  }
}

class FadeSizeTransition extends IsmailAnimatedWidget {
  /// Creates a transition which Fades in and out also animates the size
  const FadeSizeTransition({
    Key? key,
    required final Animation<double> animation,
    required this.child,
    this.axisAlignment = 0.0,
    final bool isReverse = false,
    this.axis = Axis.vertical,
  }) : super(key: key, animation: animation, isReverse: isReverse);
  const FadeSizeTransition.reverse({
    Key? key,
    required final Animation<double> animation,
    required this.child,
    this.axisAlignment = 0.0,
    this.axis = Axis.vertical,
  }) : super(key: key, animation: animation, isReverse: true);

  final Widget child;

  /// defaults to 0.0, which centers the child along the main axis during the
  /// transition.
  final double axisAlignment;

  /// [Axis.horizontal] if [sizeFactor] modifies the width, otherwise
  /// [Axis.vertical].
  final Axis axis;

  /// This the sizeFactor that is used on the SizeTransition
  Animation<double> get _sizeFactor => CurvedAnimation(
        parent: progress,
        curve: Curves.easeInOut,
      );

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacity,
      child: SizeTransition(
        axis: axis,
        axisAlignment: axisAlignment,
        sizeFactor: _sizeFactor,
        child: child,
      ),
    );
  }
}
