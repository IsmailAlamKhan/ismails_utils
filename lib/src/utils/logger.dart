import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import '../src.dart';

class IsmailLogger {
  factory IsmailLogger.root() => _root;
  static final _root = IsmailLogger('Ismail Logger');

  IsmailLogger(this.name) : logger = Logger(name);

  final String name;
  final Logger logger;

  void error(Object? message, {Object? error, StackTrace? stackTrace}) =>
      logger.shout(message, error, stackTrace);

  void warning(Object? message, {Object? warning, StackTrace? stackTrace}) =>
      logger.warning(message, warning, stackTrace);

  void info(Object? message) => logger.info(message);
  static void init() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen(_printLog);
  }

  static void _printLog(LogRecord record) {
    if (kDebugMode) {
      final level = record.level;
      final recordMessege = record.message;
      final error = record.error;
      final stack = record.stackTrace;
      final name = record.loggerName;

      final isError = level.value.between(1000, 1300);
      final isWarning = level.value == 900;
      final isNormal = level.value.between(0, 900);

      final output =
          "[$name] $recordMessege${error != null ? '\n$error' : ''}${stack != null ? '\n$stack' : ''}";
      var _messege = "";
      if (isError) {
        _messege = '🛑 \x1B[31m$output\x1B[0m ';
      }
      if (isWarning) {
        _messege = '⚠️ \x1B[33m$output\x1B[0m ⚠️';
      }
      if (isNormal) {
        _messege = '\x1B[34m ℹ️ $output ℹ️ \x1B[0m';
      }

      debugPrint(_messege);
    }
  }
}
