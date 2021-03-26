import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Debouncer {
  final int? milliseconds;
  VoidCallback? action;
  Timer? _timer;
  Debouncer({this.milliseconds});
  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(milliseconds!.milliseconds, action);
  }
}
