import 'dart:async';

import 'package:flutter/material.dart';

enum RoundedLoadingButtonState { idle, loading, success, error }

class RoundedLoadingButtonController extends ChangeNotifier {
  var _state = RoundedLoadingButtonState.idle;
  RoundedLoadingButtonState get state => _state;
  set state(RoundedLoadingButtonState state) {
    _state = state;
    notifyListeners();
  }

  bool get isIdle => _state == RoundedLoadingButtonState.idle;
  bool get isLoading => _state == RoundedLoadingButtonState.loading;
  bool get isSuccess => _state == RoundedLoadingButtonState.success;
  bool get isError => _state == RoundedLoadingButtonState.error;

  void reset() {
    state = RoundedLoadingButtonState.idle;
  }

  bool get canInteract => state == RoundedLoadingButtonState.idle;

  Timer? _timer;

  VoidCallback? onPressed(
    Future<void> Function()? callback,
    Duration animDuration,
  ) {
    if (callback != null) {
      return () async {
        if (!isIdle) return;
        _timer?.cancel();
        try {
          state = RoundedLoadingButtonState.loading;
          await Future.delayed(animDuration);

          await callback();
          state = RoundedLoadingButtonState.success;
        } catch (e) {
          await Future.delayed(animDuration);
          state = RoundedLoadingButtonState.error;
        } finally {
          await Future.delayed(animDuration);
          _timer = Timer(const Duration(seconds: 1), () {
            reset();
          });
        }
      };
    }
  }
}
