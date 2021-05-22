import 'dart:developer';

mixin Logger {
  String get name => 'Ismail Util';
  LoggerService get logger => LoggerService(name);
}

/// Simple logger service
class LoggerService {
  /// Simple logger service
  LoggerService([String? name]) {
    if (name != null) {
      _name = name;
    }
  }
  String _name = 'Ismail Util';

  /// Log an info meesege
  void info(Object? messege) {
    log('ℹ \x1B[34m$messege\x1B[0m', time: DateTime.now(), name: _name);
  }

  /// Log an error meesege
  void error(Object? messege, [Object? error, StackTrace? stack]) {
    log(
      '😭 \x1B[31m$messege\x1B[0m',
      time: DateTime.now(),
      error: error,
      stackTrace: stack,
      name: _name,
    );
  }

  /// Log a warning
  void warning(Object? messege, [Object? error, StackTrace? stack]) {
    log(
      '⚠ \x1B[33m$messege\x1B[0m',
      time: DateTime.now(),
      error: error,
      stackTrace: stack,
      name: _name,
    );
  }
}
