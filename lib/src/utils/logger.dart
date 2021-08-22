import 'dart:async';
import 'dart:developer';
import 'package:logging/logging.dart';
import 'package:ansicolor/ansicolor.dart';
import '../src.dart';

class IsmailLogger {
  factory IsmailLogger.root() => _root;
  static final _root = IsmailLogger('Ismail Logger')..init();

  IsmailLogger(String name) : logger = Logger(name);
  final Logger logger;
  late final StreamSubscription<LogRecord> streamSubscription;

  void error(Object? message, {Object? error, StackTrace? stackTrace}) =>
      logger.shout(message, error, stackTrace);

  void warning(Object? message, {Object? warning, StackTrace? stackTrace}) =>
      logger.warning(message, error, stackTrace);

  void info(Object? message) => logger.info(message);

  void init() => streamSubscription = logger.onRecord.listen(_logRecord);

  final redPen = AnsiPen()..red(bold: true);
  final yellowPen = AnsiPen()..yellow(bold: true);
  final bluePen = AnsiPen()..blue(bold: true);

  void _logRecord(LogRecord record) {
    final level = record.level;
    final messege = record.message;
    final error = record.error;
    final stack = record.stackTrace;
    final name = record.loggerName;

    final isError = record.level.value.between(1000, 1300);
    final isWarning = record.level.value == 900;
    final isNormal = record.level.value.between(0, 900);
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
    log(
      _messege,
      error: error,
      stackTrace: stack,
      level: level.value,
      name: name,
    );
  }

  void dispose() => streamSubscription.cancel();
}
