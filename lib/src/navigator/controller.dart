import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class IsmailNavigatorController extends ChangeNotifier {
  @internal
  final key = GlobalKey<NavigatorState>();
  NavigatorState get navigatorState {
    try {
      return key.currentState!;
    } catch (e) {
      throw FlutterError(
        "Coulnd't find a IsmailNavigator using the IsmailNavigatorController",
      );
    }
  }
}
