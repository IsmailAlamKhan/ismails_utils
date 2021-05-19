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
  final TextStyle? textStyle;

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
    this.textStyle,
  });

  /// Show the snacbar this method returns a [ScaffoldFeatureController].
  /// It requries the build context to show the snackbar but you can use
  /// [ContextLessNavigation] to show these either use the context
  /// from [ContextLessNavigation] or
  /// [ContextLessNavigation.ismailSnackbar]/[ContextLessNavigation.showErrorSnackbar]
  /// /[ContextLessNavigation.showSuccessSnackbar]
  SnackbarController show(
    BuildContext context,
  ) {
    return Messenger.of(context).showSnackBar(
      SnackBar(
        margin: margin,
        onVisible: onVisible,
        padding: padding,
        shape: shape,
        width: width,
        elevation: elevation,
        content: Text(text, style: textStyle),
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
    Messenger.of(context).removeCurrentSnackBar(reason: reason);
  }

  IsmailSnackbar copyWith({
    String? text,
    Color? color,
    Duration? duration,
    Animation<double>? animation,
    SnackBarAction? action,
    SnackBarBehavior? behavior,
    double? elevation,
    EdgeInsetsGeometry? margin,
    VoidCallback? onVisible,
    EdgeInsetsGeometry? padding,
    ShapeBorder? shape,
    double? width,
    TextStyle? textStyle,
  }) {
    return IsmailSnackbar(
      text: text ?? this.text,
      color: color ?? this.color,
      duration: duration ?? this.duration,
      animation: animation ?? this.animation,
      action: action ?? this.action,
      behavior: behavior ?? this.behavior,
      elevation: elevation ?? this.elevation,
      margin: margin ?? this.margin,
      onVisible: onVisible ?? this.onVisible,
      padding: padding ?? this.padding,
      shape: shape ?? this.shape,
      width: width ?? this.width,
      textStyle: textStyle ?? this.textStyle,
    );
  }
}
