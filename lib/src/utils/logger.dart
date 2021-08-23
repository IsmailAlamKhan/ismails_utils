import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import '../src.dart';

class IsmailLogger {
  factory IsmailLogger.root() => _root;
  static final _root = IsmailLogger('Ismail Logger');

  final String name;
  IsmailLogger(this.name);

  LogRecord _logRecord(
    Object? message,
    Level level, [
    Object? error,
    StackTrace? stackTrace,
  ]) =>
      LogRecord(
        level,
        message.toString(),
        name,
        error,
        stackTrace ?? StackTrace.current,
      );

  void error(Object? message, {Object? error, StackTrace? stackTrace}) =>
      _printLog(_logRecord(message, Level.SHOUT, error, stackTrace));

  void warning(Object? message, {Object? warning, StackTrace? stackTrace}) =>
      _printLog(_logRecord(message, Level.WARNING, error, stackTrace));

  void info(Object? message) => _printLog(_logRecord(message, Level.INFO));

  void _printLog(LogRecord record) {
    if (kDebugMode) {
      final level = record.level;
      final recordMessege = record.message;
      final error = record.error;
      final stack = record.stackTrace;
      final name = record.loggerName;

      final isError = level.value.between(1000, 1300);
      final isWarning = level.value == 900;
      final isNormal = level.value.between(0, 900);
      final messege =
          '[$name] $recordMessege ${error != null ? 'Error: $error' : ''}\n$stack';
      var _messege = '';
      if (isError) {
        _messege = '🛑 \x1B[31m$messege\x1B[0m ';
      }
      if (isWarning) {
        _messege = '⚠️ \x1B[33m$messege\x1B[0m ⚠️';
      }
      if (isNormal) {
        _messege = '\x1B[34m ℹ️ $messege ℹ️ \x1B[0m';
      }

      // ignore: avoid_print
      print(_messege);
    }
  }
}
