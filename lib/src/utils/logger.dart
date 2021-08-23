import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:ansicolor/ansicolor.dart';
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
      final redPen = AnsiPen()..red(bold: true);
      final yellowPen = AnsiPen()..yellow(bold: true);
      final bluePen = AnsiPen()..blue(bold: true);

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
        _messege = redPen(messege);
      }
      if (isWarning) {
        _messege = yellowPen(messege);
      }
      if (isNormal) {
        _messege = bluePen(messege);
      }

      // ignore: avoid_print
      print(_messege);
    }
  }
}
