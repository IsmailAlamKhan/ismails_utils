import 'package:flutter/material.dart';

class AnimatedCard extends ImplicitlyAnimatedWidget {
  const AnimatedCard({
    Key? key,
    Duration? duration,
    Curve? curve,
    required this.child,
    this.cardTheme,
  }) : super(
          key: key,
          duration: duration ?? const Duration(milliseconds: 500),
          curve: curve ?? Curves.easeIn,
        );
  final Widget child;
  final CardTheme? cardTheme;
  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends AnimatedWidgetBaseState<AnimatedCard> {
  _CardThemeTween? _data;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: _data!.evaluate(animation).color,
      elevation: _data!.evaluate(animation).elevation,
      shadowColor: _data!.evaluate(animation).shadowColor,
      shape: _data!.evaluate(animation).shape,
      clipBehavior: _data!.evaluate(animation).clipBehavior,
      margin: _data!.evaluate(animation).margin,
      child: widget.child,
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    final _cardTheme = widget.cardTheme ?? Theme.of(context).cardTheme;
    _data = visitor(
      _data,
      _cardTheme,
      (begin) => _CardThemeTween(begin: begin),
    ) as _CardThemeTween?;
  }
}

class _CardThemeTween extends Tween<CardTheme> {
  _CardThemeTween({CardTheme? begin, CardTheme? end})
      : super(begin: begin, end: end);

  @override
  CardTheme lerp(double t) => CardTheme.lerp(begin, end, t);
}
