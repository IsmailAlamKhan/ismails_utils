import 'dart:async';
import 'dart:developer';
import 'package:logging/logging.dart';
import 'package:logger/logger.dart' as log_printer;
import '../src.dart';

class IsmailLogger {
  factory IsmailLogger.root() => _root;
  static final _root = IsmailLogger('Ismail Logger')..init();

  IsmailLogger(String name) : logger = Logger(name);
  final Logger logger;
  final _logger = log_printer.Logger();
  late final StreamSubscription<LogRecord> streamSubscription;

  void error(Object? message, {Object? error, StackTrace? stackTrace}) =>
      logger.shout(message, error, stackTrace);

  void warning(Object? message, {Object? warning, StackTrace? stackTrace}) =>
      logger.warning(message, error, stackTrace);

  void info(Object? message) => logger.info(message);

  void init() => streamSubscription = logger.onRecord.listen(_logRecord);

  void _logRecord(LogRecord record) {
    log_printer.Level? level;
    final messege = record.message;
    final error = record.error;
    final stack = record.stackTrace;

    final isError = record.level.value.between(1000, 1300);
    final isWarning = record.level.value == 900;
    final isNormal = record.level.value.between(0, 900);
    if (isError) {
      level = log_printer.Level.error;
    }
    if (isWarning) {
      level = log_printer.Level.warning;
    }
    if (isNormal) {
      level = log_printer.Level.info;
    } else {
      level = log_printer.Level.verbose;
    }
    _logger.log(level, messege, error, stack);
  }

  void dispose() => streamSubscription.cancel();
}
