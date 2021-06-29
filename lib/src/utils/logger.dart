import 'dart:async';
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

  IsmailLogger([String? name]) : name = name ?? 'IsmailLogger';

  void error(Object? message, {Object? error, StackTrace? stackTrace}) {
    // logger.shout(messege, error, stackTrace);
    logRecord(LogRecord(
      Level.SHOUT,
      message.toString(),
      name,
      error,
      stackTrace,
      Zone.current,
    ));
  }

  void warning(Object? message, {Object? warning, StackTrace? stackTrace}) {
    logRecord(LogRecord(
      Level.WARNING,
      message.toString(),
      name,
      warning,
      stackTrace,
      Zone.current,
    ));
  }

  void info(Object? message) => logRecord(
        LogRecord(
          Level.INFO,
          message.toString(),
          name,
          null,
          StackTrace.current,
          Zone.current,
        ),
      );

  void logRecord(LogRecord record) {
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
      _messege = '😭 $messege';
    }
    if (isWarning) {
      _messege = '⚠ $messege';
    }
    if (isNormal) {
      _messege = 'ℹ $messege';
    }
    log(
      _messege,
      time: time,
      error: isNormal ? null : error,
      stackTrace: isNormal ? null : stack,
      name: name,
      level: level.value,
      sequenceNumber: sequenceNumber,
      zone: zone,
    );
  }

  IsmailLogger copyWith({String? name}) => IsmailLogger(name ?? this.name);
}
