import 'package:flutter/material.dart';

class FadeSlideTransition extends AnimatedWidget {
  const FadeSlideTransition({
    required this.animation,
    required this.slide,
    required this.child,
  }) : super(listenable: animation);
  final Animation<double> animation;
  final Tween<Offset> slide;
  final Widget child;

  Animation<double> get _progress => listenable as Animation<double>;

  Animation<double> get _opacity => CurvedAnimation(
        parent: _progress,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.easeInOut,
        ),
      );

  Animation<Offset> get _position => slide.animate(
        CurvedAnimation(
          parent: _progress,
          curve: const Interval(
            0.0,
            0.8,
            curve: Curves.easeInOut,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    if (_progress.value == 0.0) {
      return const SizedBox.shrink();
    }
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _position,
        child: child,
      ),
    );
  }
}

class FadeScaleTransition extends AnimatedWidget {
  const FadeScaleTransition({
    required this.animation,
    required this.child,
  }) : super(listenable: animation);
  final Animation<double> animation;
  final Widget child;

  Animation<double> get _progress => listenable as Animation<double>;

  Animation<double> get _opacity => CurvedAnimation(
        parent: _progress,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.easeInOut,
        ),
      );

  Animation<double> get _position => CurvedAnimation(
        parent: _progress,
        curve: const Interval(
          0.0,
          0.8,
          curve: Curves.easeInOut,
        ),
      );

  @override
  Widget build(BuildContext context) {
    if (_progress.value == 0.0) {
      return const SizedBox.shrink();
    }
    return FadeTransition(
      opacity: _opacity,
      child: ScaleTransition(
        scale: _position,
        child: child,
      ),
    );
  }
}

class FadeSizeTransition extends AnimatedWidget {
  const FadeSizeTransition({
    required this.animation,
    required this.child,
    this.axisAlignment = 0.0,
    this.isReverse = false,
    this.axis = Axis.vertical,
  }) : super(listenable: animation);
  final Animation<double> animation;
  final Widget child;
  final double axisAlignment;
  final bool isReverse;
  final Axis axis;
  Animation<double> get _progress {
    if (isReverse) {
      return Tween<double>(begin: 1.0, end: 0.0)
          .animate(listenable as Animation<double>);
    }
    return listenable as Animation<double>;
  }

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

  Animation<double> get _position => CurvedAnimation(
        parent: _progress,
        curve: const Interval(
          0.0,
          0.8,
          curve: Curves.easeInOut,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SizeTransition(
        axis: axis,
        axisAlignment: axisAlignment,
        sizeFactor: _position,
        child: child,
      ),
    );
  }
}
