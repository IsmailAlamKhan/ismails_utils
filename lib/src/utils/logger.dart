import 'dart:developer';

import 'package:logging/logging.dart';

import '../src.dart';

mixin IsmailLoggerMixin {
  String get name => 'IsmailLogger';
  IsmailLogger get _logger => IsmailLogger(name);
  void logError(Object? messege, {Object? error, StackTrace? stackTrace}) {
    _logger.error(messege, error: error, stackTrace: stackTrace);
  }

  void logWarning(Object? messege, {Object? warning, StackTrace? stackTrace}) {
    _logger.warning(messege, warning: warning, stackTrace: stackTrace);
  }

  void logInfo(Object? messege) => _logger.info(messege);
}

class IsmailLogger {
  final String name;
  Logger get logger => Logger(name);

  IsmailLogger(String? name) : name = name ?? 'IsmailLogger';
  static void init() => Logger.root.onRecord.listen(_log);

  void error(Object? messege, {Object? error, StackTrace? stackTrace}) {
    logger.shout(messege, error, stackTrace);
  }

  void warning(Object? messege, {Object? warning, StackTrace? stackTrace}) {
    logger.warning(messege, warning, stackTrace);
  }

  void info(Object? messege) => logger.info(messege);

  static void _log(LogRecord record) {
    final level = record.level;
    final messege = record.message;
    final time = record.time;
    final error = record.error;
    final stack = record.stackTrace;
    final name = record.loggerName;
    final sequenceNumber = record.sequenceNumber;
    final zone = record.zone;

    final isError = level.value.between(1000, 1300);
    final isWarning = level.value == 900;
    final isNormal = level.value.between(0, 900);
    String _messege = '';
    if (isError) {
      _messege = '😭 \x1B[31m$messege\x1B[0m';
    }
    if (isWarning) {
      _messege = '⚠ \x1B[33m$messege\x1B[0m';
    }
    if (isNormal) {
      _messege = 'ℹ \x1B[34m$messege\x1B[0m';
    }

    if (level == Level.SHOUT) {
      log(
        _messege,
        time: time,
        error: error,
        stackTrace: stack,
        name: name,
        level: level.value,
        sequenceNumber: sequenceNumber,
        zone: zone,
      );
    }
  }

  IsmailLogger copyWith({String? name}) => IsmailLogger(name ?? this.name);
}
