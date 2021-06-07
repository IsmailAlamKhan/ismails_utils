import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../src.dart';

class IsmailNavigatorController extends ChangeNotifier {
  IsmailNavigatorController() {
    key = NavigatorKey();
    navigatorState = key!.currentState;
  }
  @internal
  late NavigatorKey? key;
  late NavigatorState? navigatorState;

  @override
  void dispose() {
    key = null;
    navigatorState = null;
    super.dispose();
  }
}
