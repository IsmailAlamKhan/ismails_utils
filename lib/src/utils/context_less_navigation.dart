import 'dart:async';

import 'package:flutter/material.dart';
import '../../ismails_utils.dart';

/// {@template ContextLessNavigation}
/// wrap your widget with this to use the methods
/// of [ContextLessNavigation]
/// {@endtemplate}
class ContextLessNavigation extends StatelessWidget {
  /// {@macro ContextLessNavigation}
  const ContextLessNavigation(this.child, {Key? key}) : super(key: key);
  static final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();
  final Widget child;

  /// Get an instance of the [ContextMenu]
  static final contextMenu = ContextLessNavigation.context.contextMenu;

  /// show [IsmailSnackbar]
  static void ismailSnackbar({
    required String text,
    required Color color,
    Duration duration = const Duration(seconds: 3),
    Duration animDuration = const Duration(milliseconds: 500),
  }) =>
      IsmailSnackbar(
        text: text,
        color: color,
        animDuration: animDuration,
        duration: duration,
      ).show(context);

  /// show [IsmailSnackbar.showErrorSnackbar]
  static void showErrorSnackbar({
    required String text,
    Duration duration = const Duration(seconds: 3),
    Duration animDuration = const Duration(milliseconds: 500),
  }) =>
      IsmailSnackbar(
        text: text,
        animDuration: animDuration,
        duration: duration,
      ).showErrorSnackbar(context);

  /// show [IsmailSnackbar.showSucessSnackbar]
  static void showSuccessSnackbar({
    required String text,
    Duration duration = const Duration(seconds: 3),
    Duration animDuration = const Duration(milliseconds: 500),
  }) =>
      IsmailSnackbar(
        text: text,
        animDuration: animDuration,
        duration: duration,
      ).showSucessSnackbar(context);

  /// Get the BuildContext of [ContextLessNavigation._key]
  static BuildContext get context {
    if (_key.currentContext != null) {
      return _key.currentContext!;
    } else {
      throw "You need to use the key provided by ContextLessNavigation on the Materialapp's navigator key prop";
    }
  }

  /// Get the NavigatorState of [ContextLessNavigation]
  static NavigatorState? get _navState => _key.currentState;

  /// navigateTo equavilant to [Navigator.of(context).push()]
  static Future<T?>? navigateTo<T>(Route<T> route) => _navState?.push(route);

  /// navigateOff equavilant to [Navigator.of(context).pushReplacement()]
  static Future<T?>? navigateOff<T>(Route<T> route) =>
      _navState?.pushReplacement(route);

  /// navigateOffAll equavilant to [Navigator.of(context).pushAndRemoveUntil()]
  static Future<T?>? navigateOffAll<T>(Route<T> route) =>
      _navState?.pushAndRemoveUntil(route, (_) => false);

  /// navigateBack equavilant to [Navigator.of(context).pop()]
  static void navigateBack() => _navState?.pop();

  /// Open a dialog without context
  static Future<T?>? openDialog<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
  }) =>
      showDialog(context: context, builder: builder);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _key,
      child: child,
    );
  }
}
