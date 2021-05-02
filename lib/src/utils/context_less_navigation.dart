import 'dart:async';

import 'package:flutter/material.dart';
import '../../ismails_utils.dart';

class ContextLessNavigation extends StatelessWidget {
  const ContextLessNavigation(this.child, {Key? key}) : super(key: key);
  static final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();
  final Widget child;
  static final contextMenu = ContextLessNavigation.context.contextMenu;
  static void customSnackbar({
    required String text,
    required Color color,
    Duration duration = const Duration(seconds: 3),
    Duration animDuration = const Duration(milliseconds: 500),
  }) =>
      CustomSnackbar(
        text: text,
        color: color,
        animDuration: animDuration,
        duration: duration,
      ).show(context);
  static void showErrorSnackbar({
    required String text,
    Duration duration = const Duration(seconds: 3),
    Duration animDuration = const Duration(milliseconds: 500),
  }) =>
      CustomSnackbar(
        text: text,
        animDuration: animDuration,
        duration: duration,
      ).showErrorSnackbar(context);
  static void showSuccessSnackbar({
    required String text,
    Duration duration = const Duration(seconds: 3),
    Duration animDuration = const Duration(milliseconds: 500),
  }) =>
      CustomSnackbar(
        text: text,
        animDuration: animDuration,
        duration: duration,
      ).showSucessSnackbar(context);

  static BuildContext get context {
    if (_key.currentContext != null) {
      return _key.currentContext!;
    } else {
      throw "You need to use the key provided by ContextLessNavigation on the Materialapp's navigator key prop";
    }
  }

  static NavigatorState? get _navState => _key.currentState;

  static Future<T?>? navigateTo<T>(Route<T> route) => _navState?.push(route);

  static Future<T?>? navigateOff<T>(Route<T> route) =>
      _navState?.pushReplacement(route);

  static Future<T?>? navigateOffAll<T>(Route<T> route) =>
      _navState?.pushAndRemoveUntil(route, (_) => false);

  static void navigateBack() => _navState?.pop();
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
