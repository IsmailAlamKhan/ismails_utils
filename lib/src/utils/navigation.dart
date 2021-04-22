import 'dart:developer';

import 'package:flutter/material.dart';

class ContextLessNavigation extends StatelessWidget {
  final Widget child;
  static final GlobalKey<NavigatorState> _key = GlobalKey();
  ContextLessNavigation(this.child) : super(key: _key);
  static BuildContext get context {
    if (_key.currentContext != null) {
      return _key.currentContext!;
    } else {
      log(
        'You need to use the ContextLessNavigation widget as the parent of your whole app',
        name: 'ContextLessNavigation',
      );
      throw 'You need to use the ContextLessNavigation widget as the parent of your whole app';
    }
  }

  static Future<T?>? navigateTo<T>(Route<T> route) {
    return _key.currentState?.push(route);
  }

  static Future<T?>? navigateOff<T>(Route<T> route) {
    return _key.currentState?.pushReplacement(route);
  }

  static Future<T?>? navigateOffAll<T>(Route<T> route) {
    return _key.currentState?.pushAndRemoveUntil(route, (_) => false);
  }

  static void navigateBack() {
    _key.currentState?.pop();
  }

  @override
  Widget build(BuildContext context) => child;
}
