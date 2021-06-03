import 'package:flutter/material.dart';

import '../src.dart';

/// {@template IsmailTheme}
/// This widget is the same as [Theme] this doesn't animate the changes
/// if you want animation on change use [AnimatedIsmailTheme]
/// {@endtemplate}
class IsmailTheme extends StatelessWidget {
  /// {@macro IsmailTheme}
  const IsmailTheme({
    Key? key,
    required this.child,
    required this.data,
  }) : super(key: key);
  final IsmailThemeData data;
  final Widget child;

  /// Get the current [IsmailThemeData]
  static T of<T extends IsmailThemeData>(BuildContext context) {
    try {
      return context.dependOnInheritedWidgetOfExactType<_IsmailTheme>()!.theme
          as T;
    } catch (e) {
      throw FlutterError(
        notFoundOnScopeError('IsmailTheme or AnimatedIsmailTheme'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _IsmailTheme(
      theme: data,
      child: child,
    );
  }
}

class _IsmailTheme extends InheritedWidget {
  const _IsmailTheme({
    Key? key,
    required Widget child,
    required this.theme,
  }) : super(key: key, child: child);
  final IsmailThemeData theme;

  @override
  bool updateShouldNotify(_IsmailTheme oldWidget) => theme != oldWidget.theme;
}

/// This is used for [AnimatedIsmailTheme] you don't need to extend this when
/// you don't want your theme to change smoothly with animation
abstract class IsmailThemeDataTween<T extends IsmailThemeData>
    extends Tween<T> {
  /// Creates a [IsmailThemeData] tween.
  ///
  /// The [begin] and [end] properties must be non-null before the tween is
  /// first used, but the arguments can be null if the values are going to be
  /// filled in later.
  IsmailThemeDataTween({T? begin, T? end}) : super(begin: begin, end: end);

  @override
  T lerp(double t);
}

/// {@template AnimatedIsmailTheme}
/// This widget is an animated version of [IsmailTheme] its the same as
/// [AnimatedTheme] which the [MaterialApp] uses internally which
/// gives the smooth animation when the theme changes
/// {@endtemplate}
class AnimatedIsmailTheme extends ImplicitlyAnimatedWidget {
  /// {@macro AnimatedIsmailTheme}
  const AnimatedIsmailTheme({
    Key? key,
    required this.data,
    Curve curve = Curves.linear,
    Duration duration = kThemeAnimationDuration,
    VoidCallback? onEnd,
    required this.child,
    required this.tweenConstructor,
  }) : super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  /// The theme current theme data
  final IsmailThemeData data;

  /// The widget to return
  final Widget child;

  /// Signature for a [Tween] factory.
  ///
  /// This is the type of one of the arguments of [TweenVisitor], the signature
  /// used by [AnimatedWidgetBaseState.forEachTween].
  ///
  /// Instances of this function are expected to take a value and return a tween
  /// beginning at that value.
  final TweenConstructor<dynamic> tweenConstructor;

  @override
  _AnimatedIsmailThemeState createState() => _AnimatedIsmailThemeState();
}

class _AnimatedIsmailThemeState
    extends AnimatedWidgetBaseState<AnimatedIsmailTheme> {
  IsmailThemeDataTween? _data;
  @override
  Widget build(BuildContext context) {
    return IsmailTheme(
      data: _data!.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _data = visitor(
      _data,
      widget.data,
      widget.tweenConstructor,
    )! as IsmailThemeDataTween;
  }
}
