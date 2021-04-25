import 'dart:async';

import 'package:flutter/material.dart';

class ContextLessNavigation {
  static final GlobalKey<NavigatorState> key = GlobalKey();
  static BuildContext get context {
    if (key.currentContext != null) {
      return key.currentContext!;
    } else {
      throw "You need to use the key provided by ContextLessNavigation on the Materialapp's navigator key prop";
    }
  }

  static NavigatorState? get _navState => key.currentState;

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
}
