import 'package:flutter/material.dart';

import '../src.dart';

/// {@template IsmailSnackbar}
/// This shows the [ScaffoldMessenger.of(context).showSnackBar] with less
/// boilerplate
///{@endtemplate}
class IsmailSnackbar {
  final String text;
  final Color? color;
  final Duration duration;
  final Animation<double>? animation;
  final SnackBarAction? action;
  final SnackBarBehavior behavior;
  final double elevation;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onVisible;
  final EdgeInsetsGeometry? padding;
  final ShapeBorder? shape;
  final double? width;

  /// {@macro IsmailSnackbar}
  const IsmailSnackbar({
    required this.text,
    this.color,
    this.duration = const Duration(seconds: 3),
    this.animation,
    this.action,
    this.behavior = SnackBarBehavior.floating,
    this.elevation = 6,
    this.margin,
    this.onVisible,
    this.padding,
    this.shape,
    this.width,
  });

  /// Show the snacbar this method returns a [ScaffoldFeatureController].
  /// It requries the build context to show the snackbar but you can use
  /// [ContextLessNavigation] to show these either use the context
  /// from [ContextLessNavigation] or
  /// [ContextLessNavigation.ismailSnackbar]/[ContextLessNavigation.showErrorSnackbar]
  /// /[ContextLessNavigation.showSuccessSnackbar]
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(
    BuildContext context,
  ) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: margin,
        onVisible: onVisible,
        padding: padding,
        shape: shape,
        width: width,
        elevation: elevation,
        content: Text(text),
        backgroundColor: color,
        behavior: behavior,
        duration: duration,
        animation: animation,
        action: action,
      ),
    );
  }

  /// {@template IsmailSnackbar.hide}
  /// Hide Snackbar
  /// {@endtemplate}
  static void hide(
    BuildContext context, [
    SnackBarClosedReason reason = SnackBarClosedReason.remove,
  ]) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar(reason: reason);
  }
}
