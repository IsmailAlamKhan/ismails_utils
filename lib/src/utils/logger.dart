import 'dart:developer';

final logger = LoggerService();

class LoggerService {
  LoggerService([String? name]) {
    if (name != null) {
      this.name = name;
    }
  }
  String name = 'Ismail Util';
  void info(Object? messege) {
    log('ℹ \x1B[34m$messege\x1B[0m', time: DateTime.now(), name: name);
  }

  void error(Object? messege, [Object? error, StackTrace? stack]) {
    log(
      '😭 \x1B[31m$messege\x1B[0m',
      time: DateTime.now(),
      error: error,
      stackTrace: stack,
      name: name,
    );
  }

  void warning(Object? messege, [Object? error, StackTrace? stack]) {
    log(
      '⚠ \x1B[33m$messege\x1B[0m',
      time: DateTime.now(),
      error: error,
      stackTrace: stack,
      name: name,
    );
  }
}
