import 'package:flutter/material.dart';

import '../../ismails_utils.dart';

/// {@template ContextLessNavigation}
/// wrap your widget with this to use the methods
/// of [ContextLessNavigation]
/// {@endtemplate}
class ContextLessNavigation {
  static final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  /// Get an instance of the [ContextMenu]
  static final contextMenu = ContextLessNavigation.context.contextMenu;

  /// {@macro IsmailSnackbar}
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showSnackbar({
    required String text,
    Color? color,
    Duration duration = const Duration(seconds: 3),
    Animation<double>? animation,
    SnackBarAction? action,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    double elevation = 6,
    EdgeInsetsGeometry? margin,
    VoidCallback? onVisible,
    EdgeInsetsGeometry? padding,
    ShapeBorder? shape,
    double? width,
    TextStyle? textStyle,
  }) =>
          IsmailSnackbar(
            textStyle: textStyle,
            margin: margin,
            onVisible: onVisible,
            padding: padding,
            shape: shape,
            width: width,
            elevation: elevation,
            text: text,
            color: color,
            behavior: behavior,
            duration: duration,
            animation: animation,
            action: action,
          ).show(context);

  /// {@template IsmailSnackbar.hide}
  static void hideSnackBar([
    SnackBarClosedReason reason = SnackBarClosedReason.remove,
  ]) {
    IsmailSnackbar.hide(context, reason);
  }

  /// Get the BuildContext of [ContextLessNavigation.key]
  static BuildContext get context {
    if (key.currentContext != null) {
      return key.currentContext!;
    } else {
      throw "You need to use the key provided by ContextLessNavigation on the Materialapp's navigator key prop";
    }
  }

  /// Get the NavigatorState of [ContextLessNavigation]
  static NavigatorState get _navState {
    try {
      return key.currentState!;
    } catch (e) {
      throw "You need to use the key provided by ContextLessNavigation on the Materialapp's navigator key prop";
    }
  }

  /// navigateTo equavilant to [Navigator.of(context).push()]
  static Future<T?>? navigateTo<T>(Route<T> route) => _navState.push(route);

  /// navigateOff equavilant to [Navigator.of(context).pushReplacement()]
  static Future<T?>? navigateOff<T>(Route<T> route) =>
      _navState.pushReplacement(route);

  /// navigateOffAll equavilant to [Navigator.of(context).pushAndRemoveUntil()]
  static Future<T?>? navigateOffAll<T>(Route<T> route) =>
      _navState.pushAndRemoveUntil(route, (_) => false);

  /// navigateBack equavilant to [Navigator.of(context).pop()]
  static void navigateBack() => _navState.pop();

  /// Open a dialog without context
  static Future<T?>? openDialog<T>({
    BuildContext? ctx,
    required RoutePageBuilder pageBuilder,
    bool barrierDismissible = false,
    String? barrierLabel,
    Color barrierColor = const Color(0x80000000),
    Duration transitionDuration = const Duration(milliseconds: 200),
    RouteTransitionsBuilder? transitionBuilder,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
  }) =>
      showGeneralDialog(
        context: ctx ?? context,
        pageBuilder: pageBuilder,
        barrierColor: barrierColor,
        barrierDismissible: barrierDismissible,
        barrierLabel: barrierLabel,
        routeSettings: routeSettings,
        transitionBuilder: transitionBuilder,
        transitionDuration: transitionDuration,
        useRootNavigator: useRootNavigator,
      );
}
